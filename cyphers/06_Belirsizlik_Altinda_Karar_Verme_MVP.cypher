// 06 - BELİRSİZLİK ALTINDA KARAR VERME MVP'si

// 1. TUM NODE'LAR

MERGE (vta:BrainRegion {nodeId: "brainregion_ventral_tegmental_area"})
SET vta.name = "Ventral Tegmental Area",
vta.turkishName = "Ventral tegmental alan",
vta.description = "Dopaminerjik sinyal uretimi acisindan onemli olan ve karar verme, odul ve motivasyon surecleriyle iliskili beyin bolgesidir.",
vta.ontologySource = "Uberon",
vta.ontologyId = "UBERON:0002691",
vta.sourceUri = "http://purl.obolibrary.org/obo/UBERON_0002691",
vta.ontologyMappingType = "EXACT_MATCH";

MERGE (dopamine:Neurochemical {nodeId: "neurochemical_dopamine"})
SET dopamine.name = "Dopamine",
dopamine.turkishName = "Dopamin",
dopamine.description = "Odul, motivasyon, ogrenme ve karar verme sureclerinde rol alan katekolamin turu norokimyasal maddedir.",
dopamine.ontologySource = "ChEBI",
dopamine.ontologyId = "CHEBI:18243",
dopamine.sourceUri = "http://purl.obolibrary.org/obo/CHEBI_18243",
dopamine.ontologyMappingType = "EXACT_MATCH";

MERGE (dlpfc:BrainRegion {nodeId: "brainregion_dorsolateral_prefrontal_cortex"})
SET dlpfc.name = "Dorsolateral Prefrontal Cortex",
dlpfc.turkishName = "Dorsolateral prefrontal korteks",
dlpfc.description = "Olasilik agirliklandirma, bilissel kontrol ve riskli secim surecleriyle iliskili prefrontal korteks bolgesidir.",
dlpfc.ontologySource = "Uberon",
dlpfc.ontologyId = "UBERON:0009834",
dlpfc.sourceUri = "http://purl.obolibrary.org/obo/UBERON_0009834",
dlpfc.ontologyMappingType = "EXACT_MATCH";

MERGE (vmpfc:BrainRegion {nodeId: "brainregion_ventromedial_prefrontal_cortex"})
SET vmpfc.name = "Ventromedial Prefrontal Cortex",
vmpfc.turkishName = "Ventromedial prefrontal korteks",
vmpfc.description = "Deger temelli karar verme ve belirsizlik altinda secim surecleriyle iliskili prefrontal korteks bolgesidir.",
vmpfc.ontologySource = "Uberon / literature-based anatomical mapping",
vmpfc.ontologyId = "UBERON:0022353",
vmpfc.sourceUri = "http://purl.obolibrary.org/obo/UBERON_0022353",
vmpfc.ontologyMappingType = "CLOSE_MATCH";

MERGE (probabilityWeighting:CognitiveProcess {nodeId: "cognitiveprocess_probability_weighting"})
SET probabilityWeighting.name = "Probability Weighting",
probabilityWeighting.turkishName = "Olasilik agirliklandirma",
probabilityWeighting.description = "Bireyin olasi sonuclari nesnel olasiliklarina gore degil, oznel agirliklandirma yoluyla degerlendirmesini temsil eden bilissel surectir.",
probabilityWeighting.ontologySource = "Literature-based local concept",
probabilityWeighting.ontologyId = "local:probability_weighting",
probabilityWeighting.sourceUri = "https://doi.org/10.1038/s41598-022-18529-6",
probabilityWeighting.ontologyMappingType = "LITERATURE_BASED_LOCAL_CONCEPT";

MERGE (valueBasedDecision:CognitiveProcess {nodeId: "cognitiveprocess_value_based_decision_making"})
SET valueBasedDecision.name = "Value-Based Decision Making",
valueBasedDecision.turkishName = "Deger temelli karar verme",
valueBasedDecision.description = "Seceneklerin oznel degerlerine gore karsilastirilmasi ve davranissal karar uretimini temsil eden bilissel surectir.",
valueBasedDecision.ontologySource = "Literature-based local concept",
valueBasedDecision.ontologyId = "local:value_based_decision_making",
valueBasedDecision.sourceUri = "https://doi.org/10.1093/cercor/bhl176",
valueBasedDecision.ontologyMappingType = "LITERATURE_BASED_LOCAL_CONCEPT";

MERGE (riskEvaluation:CognitiveProcess {nodeId: "cognitiveprocess_risk_evaluation"})
SET riskEvaluation.name = "Risk Evaluation",
riskEvaluation.turkishName = "Risk degerlendirme",
riskEvaluation.description = "Belirsiz veya riskli seceneklerde olasi kazanc, kayip ve sonuc ihtimallerinin degerlendirilmesini temsil eden bilissel surectir.",
riskEvaluation.ontologySource = "Literature-based local concept",
riskEvaluation.ontologyId = "local:risk_evaluation",
riskEvaluation.sourceUri = "https://doi.org/10.1016/j.neubiorev.2015.04.021",
riskEvaluation.ontologyMappingType = "LITERATURE_BASED_LOCAL_CONCEPT";

MERGE (decisionUncertainty:CognitiveProcess {nodeId: "cognitiveprocess_decision_making_under_uncertainty"})
SET decisionUncertainty.name = "Decision Making Under Uncertainty",
decisionUncertainty.turkishName = "Belirsizlik altinda karar verme",
decisionUncertainty.description = "Sonuclari tam olarak ongorulemeyen alternatifler arasindan secim yapma surecini temsil eden bilissel surectir.",
decisionUncertainty.ontologySource = "Cognitive Atlas",
decisionUncertainty.ontologyId = "trm_4a3fd79d0a038",
decisionUncertainty.sourceUri = "https://www.cognitiveatlas.org/concept/id/trm_4a3fd79d0a038/",
decisionUncertainty.ontologyMappingType = "EXACT_MATCH";

MERGE (riskTaking:BehaviorPattern {nodeId: "behaviorpattern_risk_taking_behavior"})
SET riskTaking.name = "Risk-Taking Behavior",
riskTaking.turkishName = "Risk alma davranisi",
riskTaking.description = "Potansiyel kazanc veya kayip iceren durumlarda riskli seceneklere yonelme egilimini temsil eden davranis oruntusudur.",
riskTaking.ontologySource = "Cognitive Atlas-supported behavior mapping",
riskTaking.ontologyId = "trm_4l7BDO8GJ3LdM",
riskTaking.sourceUri = "https://www.cognitiveatlas.org/concept/id/trm_4l7BDO8GJ3LdM/",
riskTaking.ontologyMappingType = "CLOSE_MATCH";

MERGE (financialExample:BehaviorExample {nodeId: "behaviorexample_choosing_risky_investment"})
SET financialExample.name = "Choosing a Risky Investment",
financialExample.turkishName = "Riskli yatirim secimi yapmak",
financialExample.description = "Bireyin kazanc ve kayip ihtimalleri belirsiz olan bir finansal secenegi degerlendirmesidir.";

MERGE (socialExample:BehaviorExample {nodeId: "behaviorexample_making_uncertain_social_decision"})
SET socialExample.name = "Making an Uncertain Social Decision",
socialExample.turkishName = "Belirsiz sosyal karar vermek",
socialExample.description = "Bireyin sonucu tam olarak ongorulemeyen sosyal bir durumda secim yapmasidir.";

MERGE (careerExample:BehaviorExample {nodeId: "behaviorexample_choosing_risky_career_opportunity"})
SET careerExample.name = "Choosing a Risky Career Opportunity",
careerExample.turkishName = "Riskli kariyer firsati secmek",
careerExample.description = "Bireyin basari ve basarisizlik ihtimalleri belirsiz olan bir kariyer firsatini degerlendirmesidir.";




// 2. TUM RELATIONSHIP'LER

MATCH (vta:BrainRegion {nodeId: "brainregion_ventral_tegmental_area"})
MATCH (dopamine:Neurochemical {nodeId: "neurochemical_dopamine"})
MERGE (vta)-[r_vta_dopamine:RELEASES]->(dopamine)
SET r_vta_dopamine.relationshipId = "rel_vta_releases_dopamine_decision_uncertainty",
r_vta_dopamine.description = "Ventral tegmental alan, Belirsizlik Altinda Karar Verme MVP'sinde dopamin icin temel kaynak beyin bolgesi olarak temsil edilmistir.",
r_vta_dopamine.sourceKey = "brombergmartin2010dopamine",
r_vta_dopamine.doi = "10.1016/j.neuron.2010.11.022",
r_vta_dopamine.sourceUri = "https://doi.org/10.1016/j.neuron.2010.11.022",
r_vta_dopamine.evidenceNote = "Dopamin sisteminin motivasyonel kontrol, odul ve karar verme surecleriyle iliskisini desteklemek icin kullanilmistir.";

MATCH (dopamine:Neurochemical {nodeId: "neurochemical_dopamine"})
MATCH (dlpfc:BrainRegion {nodeId: "brainregion_dorsolateral_prefrontal_cortex"})
MERGE (dopamine)-[r_dopamine_dlpfc:MODULATES]->(dlpfc)
SET r_dopamine_dlpfc.relationshipId = "rel_dopamine_modulates_dlpfc_decision_uncertainty",
r_dopamine_dlpfc.description = "Dopamin, dorsolateral prefrontal korteks uzerinde duzenleyici norokimyasal oge olarak temsil edilmistir.",
r_dopamine_dlpfc.sourceKey = "seamans2004dopamine",
r_dopamine_dlpfc.doi = "10.1016/j.pneurobio.2004.05.006",
r_dopamine_dlpfc.sourceUri = "https://doi.org/10.1016/j.pneurobio.2004.05.006",
r_dopamine_dlpfc.evidenceNote = "Dopaminin prefrontal korteks islevleri uzerindeki modulasyonunu desteklemek icin kullanilmistir.";

MATCH (dopamine:Neurochemical {nodeId: "neurochemical_dopamine"})
MATCH (vmpfc:BrainRegion {nodeId: "brainregion_ventromedial_prefrontal_cortex"})
MERGE (dopamine)-[r_dopamine_vmpfc:MODULATES]->(vmpfc)
SET r_dopamine_vmpfc.relationshipId = "rel_dopamine_modulates_vmpfc_decision_uncertainty",
r_dopamine_vmpfc.description = "Dopamin, ventromedial prefrontal korteks uzerinde duzenleyici norokimyasal oge olarak temsil edilmistir.",
r_dopamine_vmpfc.sourceKey = "seamans2004dopamine",
r_dopamine_vmpfc.doi = "10.1016/j.pneurobio.2004.05.006",
r_dopamine_vmpfc.sourceUri = "https://doi.org/10.1016/j.pneurobio.2004.05.006",
r_dopamine_vmpfc.evidenceNote = "Dopaminin prefrontal korteks islevleri uzerindeki modulasyonunu desteklemek icin kullanilmistir.";

MATCH (dlpfc:BrainRegion {nodeId: "brainregion_dorsolateral_prefrontal_cortex"})
MATCH (probabilityWeighting:CognitiveProcess {nodeId: "cognitiveprocess_probability_weighting"})
MERGE (dlpfc)-[r_dlpfc_probability:INVOLVED_IN]->(probabilityWeighting)
SET r_dlpfc_probability.relationshipId = "rel_dlpfc_involved_in_probability_weighting",
r_dlpfc_probability.description = "Dorsolateral prefrontal korteks, riskli secimlerde olasilik agirliklandirma surecine katilan prefrontal bolge olarak temsil edilmistir.",
r_dlpfc_probability.sourceKey = "panidi2022dlpfc",
r_dlpfc_probability.doi = "10.1038/s41598-022-18529-6",
r_dlpfc_probability.sourceUri = "https://doi.org/10.1038/s41598-022-18529-6",
r_dlpfc_probability.evidenceNote = "DLPFC'nin riskli secimlerde probability weighting surecine nedensel katkisini desteklemek icin kullanilmistir.";

MATCH (vmpfc:BrainRegion {nodeId: "brainregion_ventromedial_prefrontal_cortex"})
MATCH (valueBasedDecision:CognitiveProcess {nodeId: "cognitiveprocess_value_based_decision_making"})
MERGE (vmpfc)-[r_vmpfc_value:INVOLVED_IN]->(valueBasedDecision)
SET r_vmpfc_value.relationshipId = "rel_vmpfc_involved_in_value_based_decision_making",
r_vmpfc_value.description = "Ventromedial prefrontal korteks, deger temelli karar verme surecine katilan prefrontal bolge olarak temsil edilmistir.",
r_vmpfc_value.sourceKey = "fellows2007vmPFC",
r_vmpfc_value.doi = "10.1093/cercor/bhl176",
r_vmpfc_value.sourceUri = "https://doi.org/10.1093/cercor/bhl176",
r_vmpfc_value.evidenceNote = "vmPFC'nin karar verme ve deger temelli yargi sureclerindeki rolunu desteklemek icin kullanilmistir.";

MATCH (probabilityWeighting:CognitiveProcess {nodeId: "cognitiveprocess_probability_weighting"})
MATCH (riskEvaluation:CognitiveProcess {nodeId: "cognitiveprocess_risk_evaluation"})
MERGE (probabilityWeighting)-[r_probability_risk:REGULATES]->(riskEvaluation)
SET r_probability_risk.relationshipId = "rel_probability_weighting_regulates_risk_evaluation",
r_probability_risk.description = "Olasilik agirliklandirma sureci, risk degerlendirme surecini duzenleyen bilissel surec olarak temsil edilmistir.",
r_probability_risk.sourceKey = "panidi2022dlpfc",
r_probability_risk.doi = "10.1038/s41598-022-18529-6",
r_probability_risk.sourceUri = "https://doi.org/10.1038/s41598-022-18529-6",
r_probability_risk.evidenceNote = "Riskli secimlerde probability weighting surecinin karar degerlendirmesine etkisini desteklemek icin kullanilmistir.";

MATCH (valueBasedDecision:CognitiveProcess {nodeId: "cognitiveprocess_value_based_decision_making"})
MATCH (riskEvaluation:CognitiveProcess {nodeId: "cognitiveprocess_risk_evaluation"})
MERGE (valueBasedDecision)-[r_value_risk:REGULATES]->(riskEvaluation)
SET r_value_risk.relationshipId = "rel_value_based_decision_making_regulates_risk_evaluation",
r_value_risk.description = "Deger temelli karar verme sureci, risk degerlendirme surecini duzenleyen bilissel surec olarak temsil edilmistir.",
r_value_risk.sourceKey = "fellows2007vmPFC",
r_value_risk.doi = "10.1093/cercor/bhl176",
r_value_risk.sourceUri = "https://doi.org/10.1093/cercor/bhl176",
r_value_risk.evidenceNote = "vmPFC'nin seceneklerin oznel degerlendirilmesiyle iliskisini desteklemek icin kullanilmistir.";

MATCH (riskEvaluation:CognitiveProcess {nodeId: "cognitiveprocess_risk_evaluation"})
MATCH (decisionUncertainty:CognitiveProcess {nodeId: "cognitiveprocess_decision_making_under_uncertainty"})
MERGE (riskEvaluation)-[r_risk_uncertainty:REGULATES]->(decisionUncertainty)
SET r_risk_uncertainty.relationshipId = "rel_risk_evaluation_regulates_decision_making_under_uncertainty",
r_risk_uncertainty.description = "Risk degerlendirme sureci, belirsizlik altinda karar verme surecini duzenleyen bilissel surec olarak temsil edilmistir.",
r_risk_uncertainty.sourceKey = "orsini2015riskrelated",
r_risk_uncertainty.doi = "10.1016/j.neubiorev.2015.04.021",
r_risk_uncertainty.sourceUri = "https://doi.org/10.1016/j.neubiorev.2015.04.021",
r_risk_uncertainty.evidenceNote = "Riskle iliskili karar verme sureclerinde risk degerlendirme ve davranissal secim arasindaki baglantiyi desteklemek icin kullanilmistir.";

MATCH (decisionUncertainty:CognitiveProcess {nodeId: "cognitiveprocess_decision_making_under_uncertainty"})
MATCH (riskTaking:BehaviorPattern {nodeId: "behaviorpattern_risk_taking_behavior"})
MERGE (decisionUncertainty)-[r_uncertainty_behavior:CONTRIBUTES_TO]->(riskTaking)
SET r_uncertainty_behavior.relationshipId = "rel_decision_making_under_uncertainty_contributes_to_risk_taking_behavior",
r_uncertainty_behavior.description = "Belirsizlik altinda karar verme sureci, risk alma davranisina katkida bulunan bilissel surec olarak temsil edilmistir.",
r_uncertainty_behavior.sourceKey = "bechara1994insensitivity",
r_uncertainty_behavior.doi = "10.1016/0010-0277(94)90018-3",
r_uncertainty_behavior.sourceUri = "https://doi.org/10.1016/0010-0277(94)90018-3",
r_uncertainty_behavior.evidenceNote = "Belirsiz sonuc ve gelecekteki sonuclara duyarlilik baglaminda karar-davranis iliskisini desteklemek icin kullanilmistir.";

MATCH (riskTaking:BehaviorPattern {nodeId: "behaviorpattern_risk_taking_behavior"})
MATCH (financialExample:BehaviorExample {nodeId: "behaviorexample_choosing_risky_investment"})
MERGE (riskTaking)-[r_example_financial:HAS_EXAMPLE]->(financialExample)
SET r_example_financial.relationshipId = "rel_risk_taking_behavior_has_example_choosing_risky_investment",
r_example_financial.description = "Riskli yatirim secimi, risk alma davranisi ornegi olarak modellenmistir.";

MATCH (riskTaking:BehaviorPattern {nodeId: "behaviorpattern_risk_taking_behavior"})
MATCH (socialExample:BehaviorExample {nodeId: "behaviorexample_making_uncertain_social_decision"})
MERGE (riskTaking)-[r_example_social:HAS_EXAMPLE]->(socialExample)
SET r_example_social.relationshipId = "rel_risk_taking_behavior_has_example_making_uncertain_social_decision",
r_example_social.description = "Belirsiz sosyal karar verme, risk alma davranisi ornegi olarak modellenmistir.";

MATCH (riskTaking:BehaviorPattern {nodeId: "behaviorpattern_risk_taking_behavior"})
MATCH (careerExample:BehaviorExample {nodeId: "behaviorexample_choosing_risky_career_opportunity"})
MERGE (riskTaking)-[r_example_career:HAS_EXAMPLE]->(careerExample)
SET r_example_career.relationshipId = "rel_risk_taking_behavior_has_example_choosing_risky_career_opportunity",
r_example_career.description = "Riskli kariyer firsati secimi, risk alma davranisi ornegi olarak modellenmistir.";





// GORSELLESTIRME SORGUSU

MATCH path1 =
(:BrainRegion {nodeId: "brainregion_ventral_tegmental_area"})
-[:RELEASES]->(:Neurochemical {nodeId: "neurochemical_dopamine"})
-[:MODULATES]->(:BrainRegion {nodeId: "brainregion_dorsolateral_prefrontal_cortex"})
-[:INVOLVED_IN]->(:CognitiveProcess {nodeId: "cognitiveprocess_probability_weighting"})
-[:REGULATES]->(:CognitiveProcess {nodeId: "cognitiveprocess_risk_evaluation"})
-[:REGULATES]->(:CognitiveProcess {nodeId: "cognitiveprocess_decision_making_under_uncertainty"})
-[:CONTRIBUTES_TO]->(:BehaviorPattern {nodeId: "behaviorpattern_risk_taking_behavior"})

MATCH path2 =
(:Neurochemical {nodeId: "neurochemical_dopamine"})
-[:MODULATES]->(:BrainRegion {nodeId: "brainregion_ventromedial_prefrontal_cortex"})
-[:INVOLVED_IN]->(:CognitiveProcess {nodeId: "cognitiveprocess_value_based_decision_making"})
-[:REGULATES]->(:CognitiveProcess {nodeId: "cognitiveprocess_risk_evaluation"})

MATCH examplePath =
(:BehaviorPattern {nodeId: "behaviorpattern_risk_taking_behavior"})
-[:HAS_EXAMPLE]->(:BehaviorExample)

RETURN path1, path2, examplePath;