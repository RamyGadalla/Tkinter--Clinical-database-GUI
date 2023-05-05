CREATE SCHEMA TIP;


# Andormea Table
CREATE TABLE IF NOT EXISTS `TIP`.`andromea` (`Patient_ID` varchar(12), `Sex` varchar(1), `Age` int(2), `Histology` varchar(20), `Diagnosis` varchar(5), `Tumor Stage` varchar(3), `Bone Marrow` varchar(3), `BC count` int(4), `CD20` varchar(8), `CD30` varchar(8), `BCL6` varchar(2), `survival` int(2), `adverse event` int(1), `RECIST` varchar(2), `Prior treatment` varchar(19)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
INSERT INTO `TIP`.`andromea` (`Patient_ID`, `Sex`, `Age`, `Histology`, `Diagnosis`, `Tumor Stage`, `Bone Marrow`, `BC count`, `CD20`, `CD30`, `BCL6`, `survival`, `adverse event`, `RECIST`, `Prior treatment`) VALUES('ANDROMEA-235', 'M', 60, 'non-Hodgkin lymphoma', 'MZL', 'III', 'NO', 2000, 'negative', 'negative', '2', 72, 6, 'PD', 'NA'), ('ANDROMEA-133', 'F', 61, 'non-Hodgkin lymphoma', 'DLBCL', 'III', 'YES', 1400, 'positive','postive', '3+', 81, 4, 'PR', 'R-CHOP chemotherapy');


#processing
CREATE TABLE IF NOT EXISTS `TIP`.`processing` (`process_ID` int(6), `trial_name` varchar(9), `trial_pt_ID` varchar(13), `visit` varchar(14), `date_recieved` varchar(10), `time_recieved` varchar(5), `date_processed` varchar(10), `time_processed` varchar(5), `tech` varchar(13), `blood` varchar(3), `core_biopsy` varchar(3), `no_core_biopsy` varchar(1), `excision` varchar(3), `size_excision` varchar(5), `fluid` varchar(3), `fluid_type` varchar(7)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
INSERT INTO `TIP`.`processing` (`process_ID`, `trial_name`, `trial_pt_ID`, `visit`, `date_recieved`, `time_recieved`, `date_processed`, `time_processed`, `tech`, `blood`, `core_biopsy`, `no_core_biopsy`, `excision`, `size_excision`, `fluid`, `fluid_type`) VALUES (500645, 'MAGIC', 'MAGIC-015', 'screening', '15-01-2022', '5:48', '16-01-2022', '9:00', 'John Davis', 'YES', 'NO', '3', 'NO', '', 'NO', ''),
 (500646, 'CHECKMATE', 'CHECKMATE-220', 'week3', '03-02-2022', '8:17', '03-02-2022', '9:00', 'Juan Garcia', 'NO', 'NO', '', 'YES', '', 'NO', ''),
 (500647, 'CLEOPATRA', 'CLEOPATRA-104', 'screening', '11-03-2022', '11:24', '11-03-2022', '10:00', 'Aaliyah Patel', 'YES', 'NO', '', 'NO', '', 'NO', ''),
 (500648, 'BRITE', 'BRITE-078', 'week24', '24-04-2022', '9:12', '24-04-2022', '11:00', 'Kim Soo-Jin', 'NO', 'NO', '', 'YES', '', 'NO', ''),
 (500649, 'ANDROMEA', 'ANDROMEA-235', 'EOT', '19-05-2022', '10:51', '19-05-2022', '11:30', 'John Davis', 'YES', 'YES', '4', 'NO', '', 'NO', ''),
 (500650, 'BOOST', 'BOOST-968', 'day6', '27-06-2022', '6:03', '27-06-2022', '9:00', 'Aaliyah Patel', 'YES', 'YES', '3', 'NO', '', 'NO', ''),
 (500651, 'MAGIC', 'MAGIC-726', 'day14', '10-07-2022', '7:36', '10-07-2022', '12:00', 'Juan Garcia', 'NO', 'NO', '', 'YES', '', 'NO', ''),
 (500652, 'WIZARD', 'WIZARD-055', 'post_surgery', '29-08-2022', '2:45', '29-08-2022', '1:00', 'John Davis', 'YES', 'NO', '', 'NO', '', 'NO', ''),
 (500653, 'KEYNOTE', 'KEYNOTE-100', 'EOT', '17-09-2022', '4:57', '17-09-2022', '2:30', 'Juan Garcia', 'YES', 'NO', '', 'NO', '', 'NO', ''),
 (500654, 'BRITE', 'BRITE-044', 'follow_up_1', '28-10-2022', '1:22', '28-10-2022', '9:30', 'Aaliyah Patel', 'YES', 'NO', '', 'NO', '', 'NO', ''),
 (500655, 'MAGIC', 'MAGIC-060', 'week3', '14-11-2022', '3:14', '14-11-2022', '10:45', 'Juan Garcia', 'YES', 'YES', '3', 'NO', '', 'NO', ''),
 (500656, 'MAGIC', 'MAGIC-019', 'week14', '09-12-2022', '10:09', '09-12-2022', '11:15', 'Kim Soo-Jin', 'YES', 'NO', '', 'NO', '', 'YES', 'pleural'),
 (500657, 'CHECKMATE', 'CHECKMATE-089', 'week12', '23-01-2022', '8:41', '23-01-2022', '12:30', 'Juan Garcia', 'YES', 'YES', '3', 'NO', '', 'NO', ''),
 (500658, 'BOOST', 'BOOST-011', 'pre-radiation', '08-02-2023', '7:02', '08-02-2023', '3:30', 'John Davis', 'NO', 'YES', '6', 'NO', '', 'NO', ''),
 (500659, 'BOOST', 'BOOST-035', 'post_radiation', '18-02-2023', '11:53', '18-02-2023', '2:45', 'Kim Soo-Jin', 'NO', 'NO', '', 'NO', '', 'YES', 'seroma'),
 (500660, 'ANDROMEA', 'ANDROMEA-133', 'screening', '30-04-2022', '6:29', '30-04-2022', '2:15', 'Aaliyah Patel', 'YES', 'NO', '', 'NO', '', 'NO', ''),
 (500661, 'WIZARD', 'WIZARD-031', 'pre_surgery', '30-06-2022', '9:08', '30-06-2022', '1:20', 'Juan Garcia', 'YES', 'NO', '', 'NO', '', 'NO', ''),
 (500662, 'BRITE', 'BRITE-034', 'screening', '13-03-2023', '5:11', '13-03-2023', '12:30', 'Kim Soo-Jin', 'YES', 'NO', '', 'NO', '', 'YES', 'Ascetic'),
 (500663, 'CLEOPATRA', 'CLEOPATRA-062', 'week3', '31-04-2023', '8:03', '31-04-2023', '1:45', 'John Davis', 'NO', 'YES', '2', 'NO', '', 'NO', ''),
 (500664, 'ROMA', 'ROMA-001', 'NOT_APPLICABLE', '23-06-2022', '9:56', '23-06-2022', '9:00', 'Aaliyah Patel', 'YES', 'NO', '', 'YES', '8x6x4', 'NO', '');
 
 #Metabolic panel
 CREATE TABLE IF NOT EXISTS `TIP`.`metabolomics_panel` (`channel` varchar(6), `marker` varchar(7), `class` varchar(15)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
 INSERT INTO `TIP`.`metabolomics_panel` (`channel`, `marker`, `class`) VALUES ('89 Y', 'CD45', 'lineage'),
 ('141 Pr', 'CD235ab', 'lipolysis'),
 ('142 Nd', 'CD66', 'gluconeogenesis'),
 ('143 Nd', 'HLA-DR', 'lineage'),
 ('144 Nd', 'CD3', 'lineage'),
 ('145 Nd', 'CD98', 'Fructolysis'),
 ('146 Nd', 'NRF2_p', 'lipolysis'),
 ('147 Sm', 'CD123', 'glycolysis'),
 ('148 Nd', 'CD11c', 'glycolysis'),
 ('149 Sm', 'CD4', 'lineage'),
 ('150 Nd', 'CD8', 'lineage'),
 ('151 Eu', 'GAPDH', 'lipolysis'),
 ('152 Sm', 'CD45RA', 'gluconeogenesis'),
 ('153 Eu', 'CytC', 'lipolysis'),
 ('154 Sm', 'FceRI', 'gluconeogenesis'),
 ('155 Gd', 'ACADM', 'glycolysis'),
 ('156 Gd', 'GLS', 'lipolysis'),
 ('158 Gd', 'CS', 'gluconeogenesis'),
 ('159 Tb', 'KEAP1', 'lipolysis'),
 ('160 Gd', 'HIF1A', 'Fructolysis'),
 ('161 Dy', 'PFKFB4', 'glycolysis'),
 ('162 Dy', 'ACC_p', 'lipolysis'),
 ('163 Dy', 'ATP5A', 'Fructolysis'),
 ('164 Dy', 'CD197', 'lipolysis'),
 ('165 Ho', 'CD14', 'lineage'),
 ('166 Er', 'VDAC1', 'Fructolysis'),
 ('167 Er', 'G6PD', 'lipolysis'),
 ('168 Er', 'CD36', 'Fructolysis'),
 ('169 Tm', 'PDK1_p', 'glycolysis'),
 ('170 Er', 'PGC1a_p', 'Fructolysis'),
 ('171 Yb', 'CD19', 'lipolysis'),
 ('172 Yb', 'GLUT1', 'gluconeogenesis'),
 ('173 Yb', 'CD38', 'lipolysis'),
 ('174 Yb', 'LDHA', 'Fructolysis'),
 ('175 Lu', 'IDH1', 'glycolysis'),
 ('176 Yb', 'HK2', 'Fructolysis'),
 ('209 Bi', 'MCT1', 'lipolysis');
 
 
 #Checkmate
 CREATE TABLE IF NOT EXISTS `TIP`.`checkmate` (`Patient_ID` varchar(13), `Age` int(2), `Sex` varchar(1), `Diagnosis` varchar(26), `Tumor Size` decimal(2,1), `Tumor Stage` varchar(4), `Metastasis` varchar(3), `Biomarker` varchar(19), `Prior Treatment` varchar(43), `ECOG PS` int(1), `RECIST` varchar(2), `Survival` int(2), `Adverse events` int(1)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
 INSERT INTO `TIP`.`checkmate` (`Patient_ID`, `Age`, `Sex`, `Diagnosis`, `Tumor Size`, `Tumor Stage`, `Metastasis`, `Biomarker`, `Prior Treatment`, `ECOG PS`, `RECIST`, `Survival`, `Adverse events`) VALUES ('CHECKMATE-220', 57, 'F', 'Non-Small Cell Lung Cancer', 4.5, ' IV', 'YES', 'EGFR mutation', 'Platinum-based chemotherapy - immunotherapy', 1, 'PR', 9, 1), ('CHECKMATE-089', 42, 'M', 'Melanoma', 2.1, ' III', 'NO', 'BRAF V600E mutation', 'Surgery - adjuvant immunotherapy', 0, 'CR', 16, 2);
 
 
 #trials_info
 CREATE TABLE IF NOT EXISTS `TIP`.`trials_info` (`trial_name` varchar(9), `trial_identifier` varchar(11), `intervention` varchar(17), `case` varchar(13), `phase` varchar(3), `sponsor` varchar(22), `principal_investigator` varchar(18), `institute` varchar(38), `study_location` varchar(6), `no_of_cohort` int(1)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
 INSERT INTO `TIP`.`trials_info` (`trial_name`, `trial_identifier`, `intervention`, `case`, `phase`, `sponsor`, `principal_investigator`, `institute`, `study_location`, `no_of_cohort`) VALUES ('BOOST', 'NCT07328720', 'mogamulizumab ', 'breast', 'II', 'investigator-initiated', 'John Williams', 'Dana-Farber', 'USA', 4),
 ('KEYNOTE', 'NCT04587271', 'Ipilimumab ', 'pancreas', 'II', 'MERECK', 'Malik Johnson', 'Princess Margaret Hospital', 'Canada', 3),
 ('CLEOPATRA', 'NCT03487218', 'SURGERY', 'liver', 'III', 'pfizer', 'Mei Ling Chen', 'MD Anderson', 'USA', 3),
 ('MAGIC', 'NCT09737257', 'Durvalumab', 'lung', 'II', 'Lily', 'Abdual-Hakim Murad', 'Mayo clinic', 'USA', 4),
 ('CHECKMATE', 'NCT03507201', 'Nivolumab ', 'solid tumors', 'II', 'GSK', 'Andrew Adams', 'Duke University Medical', 'USA', 2),
 ('ROMA', 'NCT03817709', 'RADIATION+SURGERY', 'brain', 'II', 'Roche', 'Leila Chavez', 'Memorial Sloan Kettering Cancer Center', 'USA', 3),
 ('WIZARD', 'NCT03472764', 'TAMOXIFEN', 'prostate', 'II', 'Amgen', 'Isabella Kim', 'Ottawa Hospital Research Institute', 'Canada', 2),
 ('ANDROMEA', 'NCT03737955', 'PEMBROLIZUMAB', 'hematological', 'III', 'Takeda', 'Isaiah Kimura', 'Johns Hopkins Medicine', 'USA', 3),
 ('BRITE', 'NCT03857239', 'HERCEPTIN', 'breast', 'II', 'Genentech', 'Jayden Singh', 'Cleveland Clinic', 'USA', 2);
 
 #immune panel
 CREATE TABLE IF NOT EXISTS `TIP`.`immune_panel` (`channel` varchar(6), `marker` varchar(10), `class` varchar(10)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
 INSERT INTO `TIP`.`immune_panel_1` (`channel`, `marker`, `class`) VALUES ('89 Y', 'CD45', 'lineage'),
 ('141 Pr', 'CD45RA', 'lineage'),
 ('142 Nd', 'HLA_DR', 'lineage'),
 ('143 Nd', 'ICOS', 'activation'),
 ('144 Nd', 'CD163', 'lineage'),
 ('145 Nd', 'CXCR3', 'activation'),
 ('146 Nd', 'CD8a', 'lineage'),
 ('147 Sm', 'CD4', 'lineage'),
 ('148 Nd', 'Epcam', 'lineage'),
 ('149 Sm', 'FOXP3', 'lineage'),
 ('150 Nd', 'CD103', 'activation'),
 ('151 Eu', 'CD39', 'activation'),
 ('152 Sm', 'CD11c', 'lineage'),
 ('153 Eu', 'CD3', 'lineage'),
 ('154 Sm', 'CD69', 'activation'),
 ('155 Gd', 'CD45RO', 'lineage'),
 ('156 Gd', 'CD14', 'lineage'),
 ('158 Gd', 'CD27', 'activation'),
 ('159 Tb', 'CD19', 'lineage'),
 ('160 Gd', 'CD25', 'lineage'),
 ('161 Dy', 'Ki-67', 'activation'),
 ('162 Dy', 'CD28', 'exhaustion'),
 ('163 Dy', 'CD137', 'exhaustion'),
 ('164 Dy', 'Granzyme B', 'activation'),
 ('165 Ho', 'PD1', 'exhaustion'),
 ('166 Er', 'CD31', 'stem cell'),
 ('167 Er', 'CD95', 'exhaustion'),
 ('168 Er', 'CXCR5', 'exhaustion'),
 ('169 Tm', 'TCRgd', 'lineage'),
 ('170 Er', 'CTLA4', 'activation'),
 ('171 Yb', 'Helios', 'activation'),
 ('172 Yb', 'CD127', 'lineage'),
 ('173 Yb', 'NKp46', 'lineage'),
 ('174 Yb', 'TIGIT', 'exhaustion'),
 ('175 Lu', 'PDL1', 'exhaustion'),
 ('176 Yb', 'CD133', 'stem cell'),
 ('209 Bi', 'CD16', 'lineage');
 
 #keynote
 CREATE TABLE IF NOT EXISTS `TIP`.`keynote` (`Patient_ID` varchar(11), `Age` int(2), `Sex` varchar(1), `Histologgy` varchar(21), `Stage` varchar(2), `Tumor Location` varchar(16), `Tumor Size` varchar(6), `Metastasis` varchar(3), `CA 19-9` int(3), `KRAS Mutation` varchar(8), `TP53 Mutation` varchar(8), `Prior Treatment` varchar(32), `Adverse events` int(1), `Survival` int(1), `RECIST` varchar(2)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
 INSERT INTO `TIP`.`keynote` (`Patient_ID`, `Age`, `Sex`, `Histologgy`, `Stage`, `Tumor Location`, `Tumor Size`, `Metastasis`, `CA 19-9`, `KRAS Mutation`, `TP53 Mutation`, `Prior Treatment`, `Adverse events`, `Survival`, `RECIST`) VALUES ('KEYNOTE-100', 63, 'M', 'Ductal Adenocarcinoma', 'IV', 'Head of Pancreas', '3.0 cm', 'Yes', 800, 'Positive', 'Negative', 'Surgery, chemotherapy, radiation', 1, 5, 'SD');
 
 #Wizard
 CREATE TABLE IF NOT EXISTS `TIP`.`wizard` (`Patient_ID` varchar(10), `Sex` varchar(1), `Age` int(2), `Stage` varchar(2), `PSA Level` decimal(2,1), `Gleason Score` varchar(7), `Clinical Stage` varchar(3), `Biomarker Status` varchar(6), `Prior Treatment` varchar(47), `Adverse events` int(1), `Survival` int(1), `RECIST` varchar(2)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
 INSERT INTO `TIP`.`wizard` (`Patient_ID`, `Sex`, `Age`, `Stage`, `PSA Level`, `Gleason Score`, `Clinical Stage`, `Biomarker Status`, `Prior Treatment`, `Adverse events`, `Survival`, `RECIST`) VALUES ('WIZARD-055', 'M', 65, 'II', 8.2, '7 (3+4)', 'T2c', 'AR-V7+', 'Radiation therapy, androgen deprivation therapy', 2, 6, 'PR'), ('WIZARD-031', 'M', 72, 'II', 5.6, '9 (4+5)', 'T3b', 'AR-V7-', 'Radical prostatectomy', 1, 3, 'PD');
 
 #BRITE
 CREATE TABLE IF NOT EXISTS `TIP`.`brite` (`Patient_ID` varchar(9), `Histology` varchar(15), `Tumor size` decimal(2,1), `Tumor stage` varchar(3), `Sex` varchar(1), `Age` int(2), `HER2` varchar(2), `ER` int(1), `PR` int(1), `Lymph node` int(1), `BRCA` varchar(8), `Survival` int(1), `Adverse events` int(1), `Pregnancy` varchar(3), `RECIST` varchar(2)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
 INSERT INTO `TIP`.`brite` (`Patient_ID`, `Histology`, `Tumor size`, `Tumor stage`, `Sex`, `Age`, `HER2`, `ER`, `PR`, `Lymph node`, `BRCA`, `Survival`, `Adverse events`, `Pregnancy`, `RECIST`) VALUES ('BRITE-078', 'IDC', 3.5, 'III', 'F', 43, '6+', 4, 3, 0, 'negative', 3, 2, 'YES', 'CR'), ('BRITE-044', 'Invasive ductal', 2, 'III', 'F', 54, '2', 5, 2, 3, 'negative', 7, 4, 'YES', 'PD'), ('BRITE-034', 'mucinous', 3.6, 'II', 'F', 66, '0', 0, 0, 6, 'positive', 8, 1, 'NO', 'PR');
 
 
#MAGIC
CREATE TABLE IF NOT EXISTS `TIP`.`magic` (`Patient_ID` varchar(9), `Age` int(2), `Sex` varchar(1), `Histologic Type` varchar(26), `Stage` varchar(3), `Tumor Size` varchar(3), `Lymph Node Status` varchar(8), `EGFR Mutation` varchar(10), `ALK Rearrangement` varchar(10), `PD-L1 Expression` varchar(10), `Smoking History` varchar(14), `Prior Treatment` varchar(27), `RECIST` varchar(2), `Survival` decimal(2,1), `Adverse events` int(1)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
INSERT INTO `TIP`.`magic` (`Patient_ID`, `Age`, `Sex`, `Histologic Type`, `Stage`, `Tumor Size`, `Lymph Node Status`, `EGFR Mutation`, `ALK Rearrangement`, `PD-L1 Expression`, `Smoking History`, `Prior Treatment`, `RECIST`, `Survival`, `Adverse events`) VALUES ('MAGIC-015', 65, 'M', 'Non-Small Cell Lung Cancer', 'III', '4,2', 'Positive', 'Negative', 'Positive', '<1', 'Former smoker', 'Chemotherapy, immunotherapy', 'PR', 4, 2), ('MAGIC-726', 54, 'F', 'Small Cell Lung Cancer', 'III', '5', 'Positive', 'Not tested', 'Not tested', 'Not tested', 'Current smoker', 'Chemotherapy', 'SD', 5, 2), ('MAGIC-060', 62, 'M', 'Small Cell Lung Cancer', 'IV', '3.9', 'Positive', 'negative', 'negative', 'Not tested', 'Former smoker', 'IO', 'PD', 3.2, 3), ('MAGIC-019', 59, 'M', 'Non-Small Cell Lung Cancer', 'III', '3.6', 'Positive', 'postive', 'Positive', '<5', 'Former smoker', 'IO', 'CR', 5.2, 1);

#CLEOPATRA
CREATE TABLE IF NOT EXISTS `TIP`.`cleopatra` (`pt_ID` varchar(13), `age` int(2), `sex` varchar(1), `diagnosis` varchar(24), `Tumor Size` varchar(6), `tumor site` varchar(10), `Metastasis` varchar(3), `AFP` int(4), `ALT` int(2), `AST` int(2), `Bilirubin` decimal(2,1), `RECIST` varchar(2), `survival` int(2), `advrese_events` int(1)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
INSERT INTO `TIP`.`cleopatra` (`pt_ID`, `age`, `sex`, `diagnosis`, `Tumor Size`, `tumor site`, `Metastasis`, `AFP`, `ALT`, `AST`, `Bilirubin`, `RECIST`, `survival`, `advrese_events`) VALUES ('CLEOPATRA-104', 62, 'M', 'Hepatocellular carcinoma', '6.7 cm', 'Right lobe', 'No', 347, 68, 84, 1.2, 'PD', 15, 1), ('CLEOPATRA-062', 48, 'F', 'Cholangiocarcinoma', '4.2 cm', 'Left lobe', 'Yes', 1165, 42, 58, 1, 'PD', 8, 2);

#BOOST
CREATE TABLE IF NOT EXISTS `TIP`.`boost` (`Patient_ID` varchar(9), `Histology` varchar(18), `Tumor size` decimal(2,1), `Tumor Stage` varchar(3), `Sex` varchar(1), `Age` int(2), `HER2` int(1), `ER` varchar(2), `PR` varchar(2), `BRCA` varchar(8), `Lymph node` int(1), `Survival` int(1), `Adverse events` int(1), `Pregnancy` varchar(3), `RECIST` varchar(2)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
INSERT INTO `TIP`.`boost` (`Patient_ID`, `Histology`, `Tumor size`, `Tumor Stage`, `Sex`, `Age`, `HER2`, `ER`, `PR`, `BRCA`, `Lymph node`, `Survival`, `Adverse events`, `Pregnancy`, `RECIST`) VALUES ('BOOST-968', 'IDC', 3.5, 'III', 'F', 39, 3, '6+', '6+', 'negative', 0, 6, 2, 'NO', 'PD'), ('BOOST-011', 'Invasive papillary', 2, 'II', 'F', 73, 0, '0', '0', 'negative', 3, 4, 2, 'YES', 'CR'), ('BOOST-035', 'Invasive lobular', 3.6, 'II', 'M', 52, 4, '5', '2', 'positive', 6, 7, 1, 'NO', 'PR');

#ROMA
CREATE TABLE IF NOT EXISTS `TIP`.`roma` (`pt_ID` varchar(8), `sex` varchar(1), `age` int(2), `histology` varchar(10), `diagnosis` varchar(20), `MGMT` varchar(11), `EGFR` varchar(9), `ATRX` varchar(8), `IDH1` varchar(8), `IDH2` varchar(8)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
INSERT INTO `TIP`.`roma` (`pt_ID`, `sex`, `age`, `histology`, `diagnosis`, `MGMT`, `EGFR`, `ATRX`, `IDH1`, `IDH2`) VALUES ('ROMA-001', 'M', 70, 'giant cell', 'primary glioblastoma', 'mytheylated', 'amplified', 'negative', 'negative', 'negative');


#TransData_info
CREATE TABLE IF NOT EXISTS `TIP`.`transdata_info` (`Patient_ID` varchar(13), `visit` varchar(14), `sample_type` varchar(16), `FLOW` varchar(3), `Treg_panel` varchar(10), `NKTcell_panel` varchar(10), `Myeloid_panel` varchar(10), `CyTOF` varchar(3), `immune_panel` varchar(10), `metabolomic_panel` varchar(10), `luminex` varchar(3), `IMC` varchar(3), `NK_panel` varchar(10), `scRNA` varchar(3)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
INSERT INTO `TIP`.`transdata_info` (`Patient_ID`, `visit`, `sample_type`, `FLOW`, `Treg_panel`, `NKTcell_panel`, `Myeloid_panel`, `CyTOF`, `immune_panel`, `metabolomic_panel`, `luminex`, `IMC`, `NK_panel`, `scRNA`) VALUES ('MAGIC-015', 'screening', 'PBMC', 'YES', '', '', '', 'YES', '', '', '', '', '', 'YES'),
 ('MAGIC-015', 'screening', 'serum', '', '', '', '', '', '', '', 'YES', '', '', ''),
 ('MAGIC-015', 'screening', 'biospy', 'YES', '', '', '', '', '', '', '', '', '', ''),
 ('CHECKMATE-220', 'week3', 'biospy', 'YES', '', '', '', '', '', '', '', 'YES', '', 'YES'),
 ('ANDROMEA-235', 'EOT', 'PBMC', 'YES', '', '', '', 'YES', '', '', '', '', '', ''),
 ('ANDROMEA-235', 'EOT', 'biospy', 'YES', '', '', '', '', '', '', '', 'YES', '', 'YES'),
 ('ANDROMEA-235', 'EOT', 'serum', '', '', '', '', '', '', '', 'YES', '', '', ''),
 ('ROMA-001', 'NOT_APPLICABLE', 'whole_blood', 'YES', '', '', '', '', '', '', '', '', '', ''),
 ('ROMA-001', 'NOT_APPLICABLE', 'PBMC', '', '', '', '', 'YES', '', '', '', '', '', 'YES'),
 ('ROMA-001', 'NOT_APPLICABLE', 'frozen_section', '', '', '', '', '', '', '', '', 'YES', '', ''),
 ('BRITE-044', 'follow_up_1', 'PBMC', 'YES', '', '', '', 'YES', '', '', '', '', '', 'YES'),
 ('MAGIC-019', 'week14', 'PBMC', 'YES', '', '', '', 'YES', '', '', '', '', '', ''),
 ('MAGIC-019', 'week14', 'pleural', 'YES', '', '', '', 'YES', '', '', 'YES', '', '', ''),
 ('BOOST-011', 'pre-radiation', 'biopsy', 'YES', '', '', '', '', '', '', '', '', '', ''),
 ('BOOST-011', 'pre-radiation', 'frozen_section', '', '', '', '', '', '', '', '', 'YES', '', ''),
 ('KEYNOTE-100', 'EOT', 'PBMC', 'YES', '', '', '', 'YES', '', '', '', '', '', 'YES'),
 ('KEYNOTE-100', 'EOT', 'plasma', '', '', '', '', '', '', '', 'YES', '', '', ''),
 ('WIZARD-031', 'pre_surgery', 'PBMC', '', '', '', '', 'YES', '', '', '', '', '', ''),
 ('BOOST-968', 'day6', 'biopsy', 'YES', '', '', '', 'YES', '', '', '', '', '', ''),
 ('BOOST-968', 'day6', 'PBMC', 'YES', '', '', '', 'YES', '', '', '', '', '', ''),
 ('BOOST-968', 'day6', 'frozen_section', '', '', '', '', '', '', '', '', 'YES', '', ''),
 ('MAGIC-726', 'day14', 'biopsy', '', '', '', '', 'YES', '', '', '', '', '', ''),
 ('BRITE-034', 'screening', 'PBMC', 'YES', '', '', '', 'YES', '', '', '', '', '', 'YES'),
 ('BRITE-034', 'screening', 'ascetic', 'YES', '', '', '', 'YES', '', '', 'YES', '', '', ''),
 ('CHECKMATE-089', 'week12', 'PBMC', 'YES', '', '', '', '', '', '', '', '', '', ''),
 ('CHECKMATE-089', 'week12', 'biopsy', '', '', '', '', 'YES', '', '', '', '', '', ''),
 ('CHECKMATE-089', 'week12', 'paraffin_section', '', '', '', '', '', '', '', '', 'YES', '', ''),
 ('CLEOPATRA-104', 'screening', 'PBMC', 'YES', '', '', '', 'YES', '', '', '', '', '', 'YES'),
 ('CLEOPATRA-104', 'screening', 'serum', '', '', '', '', '', '', '', 'YES', '', '', ''),
 ('ANDROMEA-133', 'screening', 'PBMC', 'YES', '', '', '', 'YES', '', '', '', '', '', ''),
 ('ANDROMEA-133', 'screening', 'plasma', '', '', '', '', '', '', '', 'YES', '', '', '');
