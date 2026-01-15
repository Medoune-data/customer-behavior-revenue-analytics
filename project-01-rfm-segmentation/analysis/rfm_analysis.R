# ============================================================
# PROJET 1 — SEGMENTATION CLIENT ORIENTÉE VALEUR (RFM)
# Script R : Analyse RFM & priorisation business
# ============================================================

# ------------------------------------------------------------
# 1. LIBRARIES & DB CONNECTION
# ------------------------------------------------------------

library(tidyverse)
library(DBI)
library(RSQLite)
library(lubridate)

# Connexion à la base SQLite
med <- dbConnect(SQLite(), "~/Documents/medoune.db")

# Import des transactions nettoyées depuis SQL
data <- dbGetQuery(med, "SELECT * FROM transactions_valides")

# Exploration rapide
str(data)
head(data)

# ------------------------------------------------------------
# 2. CORRECTION DES DATES
# ------------------------------------------------------------

data <- data %>%
  mutate(
    InvoiceDate = mdy_hm(InvoiceDate)
  )

# ------------------------------------------------------------
# 3. DATE DE RÉFÉRENCE
# ------------------------------------------------------------

data_ref <- max(data$InvoiceDate, na.rm = TRUE)

# ------------------------------------------------------------
# 4. TABLE RFM (AGRÉGATION CLIENT)
# ------------------------------------------------------------

rfm_table <- data %>%
  group_by(CustomerID) %>%
  summarise(
    recence = as.numeric(difftime(data_ref, max(InvoiceDate), units = "days")),
    frequence = n_distinct(InvoiceNo),
    montant = sum(total)
  ) %>%
  filter(!is.na(CustomerID))

# -----------------------------------------------------------
# 5. SEGMENTATION RFM — VERSION MÉTIER / COMEX
# -----------------------------------------------------------

rfm_final <- rfm_table %>%
  
  # 5.1 CALCUL DES SCORES RFM (SEUILS MÉTIER)
  mutate(
    r_score = case_when(
      recence <= 30   ~ 5,
      recence <= 90   ~ 4,
      recence <= 180  ~ 3,
      recence <= 365  ~ 2,
      TRUE            ~ 1
    ),
    f_score = case_when(
      frequence == 1  ~ 1,
      frequence <= 3  ~ 2,
      frequence <= 10 ~ 3,
      frequence <= 30 ~ 4,
      TRUE            ~ 5
    ),
    m_score = case_when(
      montant <= 500     ~ 1,
      montant <= 2000    ~ 2,
      montant <= 10000   ~ 3,
      montant <= 50000   ~ 4,
      TRUE               ~ 5
    )
  ) %>%
  
  # 5.2 SEGMENTATION COMPORTEMENTALE (5 SEGMENTS)
  mutate(
    Segment = case_when(
      r_score >= 4 & f_score >= 3 & m_score >= 3 ~ "VIP",
      r_score >= 4 & f_score <= 2                ~ "Récents",
      r_score <= 2 & f_score >= 3 & m_score >= 2 ~ "À Risque",
      r_score <= 2 & f_score <= 2                ~ "Dormants",
      TRUE                                       ~ "Fidèles"
    )
  ) %>%
  
  # 5.3 CLASSIFICATION ABC INTRA-SEGMENT
  group_by(Segment) %>%
  arrange(desc(montant), .by_group = TRUE) %>%
  mutate(
    ca_cumul_segment = cumsum(montant),
    ca_total_segment = sum(montant),
    pct_ca_cumul_segment = ca_cumul_segment / ca_total_segment,
    ABC_intra = case_when(
      pct_ca_cumul_segment <= 0.80 ~ "A",
      pct_ca_cumul_segment <= 0.95 ~ "B",
      TRUE                         ~ "C"
    )
  ) %>%
  ungroup() %>%
  
  # 5.4 ANALYSE PARETO GLOBALE (% CLIENTS → % CA)
  arrange(desc(montant)) %>%
  mutate(
    total_clients = n(),
    rang_client = row_number(),
    pct_clients = rang_client / total_clients,
    ca_cumul = cumsum(montant),
    ca_total = sum(montant),
    pct_ca = ca_cumul / ca_total,
    Pareto_Classique = case_when(
      pct_clients <= 0.20 ~ "Top 20% Clients",
      pct_clients <= 0.50 ~ "Milieu 30% Clients",
      TRUE                ~ "Bas 50% Clients"
    ),
    Top_20_Clients = ifelse(pct_clients <= 0.20, "Oui", "Non")
  ) %>%
  
  # 5.5 PRIORISATION EXÉCUTIVE (3 NIVEAUX)
  mutate(
    Priorite_Exec = case_when(
      Segment == "VIP" & ABC_intra == "A"       ~ "P1 - Investir (VIP A)",
      Segment == "À Risque" & ABC_intra == "A" ~ "P1 - Investir (Risque A)",
      Segment == "VIP" & ABC_intra == "B"       ~ "P2 - Maintenir (VIP B)",
      Segment == "Récents" & ABC_intra == "A"   ~ "P2 - Tester (Récents A)",
      Segment == "Fidèles" & ABC_intra == "A"   ~ "P2 - Maintenir (Fidèles A)",
      Segment == "Dormants"                     ~ "P3 - Automatiser (Dormants)",
      Segment == "À Risque" & ABC_intra == "C" ~ "P3 - Limiter (Risque C)",
      Segment == "Fidèles" & ABC_intra == "C"   ~ "P3 - Automatiser (Fidèles C)",
      TRUE                                      ~ "P2 - Maintenir"
    ),
    Budget_Category = case_when(
      Priorite_Exec == "P1 - Investir (VIP A)"      ~ "Élevé - ROI Max",
      Priorite_Exec == "P1 - Investir (Risque A)"  ~ "Élevé - Urgence",
      Priorite_Exec == "P2 - Maintenir (VIP B)"    ~ "Moyen - Bon ROI",
      Priorite_Exec == "P2 - Tester (Récents A)"   ~ "Moyen - Potentiel",
      Priorite_Exec == "P2 - Maintenir (Fidèles A)"~ "Moyen - Base",
      TRUE                                         ~ "Faible - Efficience"
    ),
    Dormants_Risk = ifelse(
      Segment == "Dormants" & ABC_intra == "A",
      "Valeur passée - ROI incertain",
      "Standard"
    )
  )

