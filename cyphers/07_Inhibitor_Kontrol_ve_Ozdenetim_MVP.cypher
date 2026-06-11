// 07 - İNHİBTÖR KONTROL VE ÖZ DENETİM MVP'Sİ

// 1) TÜM NODE'LAR

MERGE (pfc:BrainRegion {nodeId: "brainregion_prefrontal_cortex"})
SET pfc.name = "Prefrontal Cortex",
pfc.turkishName = "Prefrontal korteks",
pfc.description = "Yürütücü kontrol, davranış düzenleme ve yerel GABAerjik inhibitör iletimle ilişkili kortikal beyin bölgesidir.",
pfc.ontologySource = "Uberon",
pfc.ontologyId = "UBERON:0000451",
pfc.sourceUri = "http://purl.obolibrary.org/obo/UBERON_0000451",
pfc.ontologyMappingType = "EXACT_MATCH";

MERGE (gaba:Neurochemical {nodeId: "neurochemical_gaba"})
SET gaba.name = "GABA",
gaba.turkishName = "GABA",
gaba.description = "Merkezi sinir sisteminde inhibitör iletimle ilişkili temel nörokimyasal öğedir.",
gaba.ontologySource = "ChEBI",
gaba.ontologyId = "CHEBI:16865",
gaba.sourceUri = "https://www.ebi.ac.uk/chebi/CHEBI:16865",
gaba.ontologyMappingType = "EXACT_MATCH";

MERGE (rifg:BrainRegion {nodeId: "brainregion_right_inferior_frontal_gyrus"})
SET rifg.name = "Right Inferior Frontal Gyrus",
rifg.turkishName = "Sağ inferior frontal girus",
rifg.description = "Tepki inhibisyonu ve inhibitör kontrol süreçleriyle ilişkilendirilen sağ prefrontal kortikal bölgedir.",
rifg.ontologySource = "Uberon + literature-based right qualifier",
rifg.ontologyId = "UBERON:0002998 + local:right_qualifier",
rifg.sourceUri = "http://purl.obolibrary.org/obo/UBERON_0002998",
rifg.ontologyMappingType = "CLOSE_MATCH";

MERGE (responseInhibition:CognitiveProcess {nodeId: "cognitiveprocess_response_inhibition"})
SET responseInhibition.name = "Response Inhibition",
responseInhibition.turkishName = "Tepki inhibisyonu",
responseInhibition.description = "Bağlama uygun olmayan veya hedefe müdahale eden davranışsal tepkinin baskılanması sürecidir.",
responseInhibition.ontologySource = "Cognitive Atlas",
responseInhibition.ontologyId = "trm_4a3fd79d0af66",
responseInhibition.sourceUri = "https://www.cognitiveatlas.org/concept/id/trm_4a3fd79d0af66/",
responseInhibition.ontologyMappingType = "EXACT_MATCH";

MERGE (selfControl:CognitiveProcess {nodeId: "cognitiveprocess_self_control"})
SET selfControl.name = "Self-Control",
selfControl.turkishName = "Öz denetim",
selfControl.description = "Kısa vadeli dürtü veya otomatik tepkiye karşı daha uygun hedefe bağlı kalmayı sağlayan bilişsel kontrol kapasitesidir.",
selfControl.ontologySource = "Literature-based local concept",
selfControl.ontologyId = "local:self_control",
selfControl.sourceUri = "https://doi.org/10.1146/annurev-psych-113011-143750",
selfControl.ontologyMappingType = "LITERATURE_BASED_LOCAL_CONCEPT";

MERGE (impulseRegulation:BehaviorPattern {nodeId: "behaviorpattern_impulse_regulation"})
SET impulseRegulation.name = "Impulse Regulation",
impulseRegulation.turkishName = "Dürtü düzenleme",
impulseRegulation.description = "Dürtüsel davranışların bağlama ve hedefe göre düzenlenmesini ifade eden davranış örüntüsüdür.",
impulseRegulation.ontologySource = "Literature-based local concept",
impulseRegulation.ontologyId = "local:impulse_regulation",
impulseRegulation.sourceUri = "https://doi.org/10.1016/j.pneurobio.2013.06.005",
impulseRegulation.ontologyMappingType = "LITERATURE_BASED_LOCAL_CONCEPT";

MERGE (exampleDelayPurchase:BehaviorExample {nodeId: "behaviorexample_delaying_impulsive_purchase"})
SET exampleDelayPurchase.name = "Delaying an Impulsive Purchase",
exampleDelayPurchase.turkishName = "Dürtüsel satın almayı erteleme",
exampleDelayPurchase.description = "Kısa vadeli satın alma isteğini daha uygun bir hedef için erteleme davranışıdır.";

MERGE (exampleStopReply:BehaviorExample {nodeId: "behaviorexample_stopping_automatic_reply"})
SET exampleStopReply.name = "Stopping an Automatic Reply",
exampleStopReply.turkishName = "Otomatik yanıtı durdurma",
exampleStopReply.description = "Ani bir tepki vermeden önce davranışı durdurma ve yeniden değerlendirme örneğidir.";

MERGE (exampleResistPhone:BehaviorExample {nodeId: "behaviorexample_resisting_phone_checking"})
SET exampleResistPhone.name = "Resisting Phone Checking While Studying",
exampleResistPhone.turkishName = "Çalışırken telefonu kontrol etme isteğine direnme",
exampleResistPhone.description = "Dikkati bölen dürtüsel kontrol davranışını baskılayarak hedefe bağlı kalma örneğidir.";



// 2) TÜM İLİŞKİLER

MATCH (pfc:BrainRegion {nodeId: "brainregion_prefrontal_cortex"})
MATCH (gaba:Neurochemical {nodeId: "neurochemical_gaba"})
MERGE (pfc)-[r_releases_gaba:RELEASES]->(gaba)
SET r_releases_gaba.relationshipId = "rel_prefrontal_cortex_releases_gaba_inhibitory_control",
r_releases_gaba.description = "Prefrontal korteks, bu MVP'de yerel GABAerjik inhibitör iletim bağlamında GABA salınımıyla ilişkilendirilmiştir.",
r_releases_gaba.sourceKey = "tremblay2016gabaergic",
r_releases_gaba.doi = "10.1016/j.neuron.2016.06.033",
r_releases_gaba.sourceUri = "https://doi.org/10.1016/j.neuron.2016.06.033",
r_releases_gaba.evidenceNote = "Neokortikal GABAerjik interneuronların yerel inhibitör iletim ve kortikal ağ düzenleme rolünü desteklemek için kullanılmıştır.";

MATCH (gaba:Neurochemical {nodeId: "neurochemical_gaba"})
MATCH (rifg:BrainRegion {nodeId: "brainregion_right_inferior_frontal_gyrus"})
MERGE (gaba)-[r_modulates_rifg:MODULATES]->(rifg)
SET r_modulates_rifg.relationshipId = "rel_gaba_modulates_right_inferior_frontal_gyrus",
r_modulates_rifg.description = "GABA, sağ inferior frontal girus ile ilişkili inhibitör kontrol süreçlerini düzenleyici nörokimyasal öğe olarak temsil edilmiştir.",
r_modulates_rifg.sourceKey = "tremblay2016gabaergic",
r_modulates_rifg.doi = "10.1016/j.neuron.2016.06.033",
r_modulates_rifg.sourceUri = "https://doi.org/10.1016/j.neuron.2016.06.033",
r_modulates_rifg.evidenceNote = "GABA'nın kortikal ağlarda inhibitör modülasyon rolü üzerinden bu ilişki kurulmuştur.";

MATCH (rifg:BrainRegion {nodeId: "brainregion_right_inferior_frontal_gyrus"})
MATCH (responseInhibition:CognitiveProcess {nodeId: "cognitiveprocess_response_inhibition"})
MERGE (rifg)-[r_involved_response:INVOLVED_IN]->(responseInhibition)
SET r_involved_response.relationshipId = "rel_right_inferior_frontal_gyrus_involved_in_response_inhibition",
r_involved_response.description = "Sağ inferior frontal girus, tepki inhibisyonu sürecinde rol alan beyin bölgesi olarak temsil edilmiştir.",
r_involved_response.sourceKey = "aron2014inhibition",
r_involved_response.doi = "10.1016/j.tics.2013.12.001",
r_involved_response.sourceUri = "https://doi.org/10.1016/j.tics.2013.12.001",
r_involved_response.evidenceNote = "Sağ inferior frontal korteksin inhibitory control ve response inhibition süreçlerindeki rolünü desteklemek için kullanılmıştır.";

MATCH (responseInhibition:CognitiveProcess {nodeId: "cognitiveprocess_response_inhibition"})
MATCH (selfControl:CognitiveProcess {nodeId: "cognitiveprocess_self_control"})
MERGE (responseInhibition)-[r_regulates_selfcontrol:REGULATES]->(selfControl)
SET r_regulates_selfcontrol.relationshipId = "rel_response_inhibition_regulates_self_control",
r_regulates_selfcontrol.description = "Tepki inhibisyonu, öz denetim sürecini düzenleyen bilişsel süreç olarak temsil edilmiştir.",
r_regulates_selfcontrol.sourceKey = "diamond2013executive",
r_regulates_selfcontrol.doi = "10.1146/annurev-psych-113011-143750",
r_regulates_selfcontrol.sourceUri = "https://doi.org/10.1146/annurev-psych-113011-143750",
r_regulates_selfcontrol.evidenceNote = "Yürütücü işlevler içinde inhibitory control ve self-control ilişkisini desteklemek için kullanılmıştır.";

MATCH (selfControl:CognitiveProcess {nodeId: "cognitiveprocess_self_control"})
MATCH (impulseRegulation:BehaviorPattern {nodeId: "behaviorpattern_impulse_regulation"})
MERGE (selfControl)-[r_contributes_impulse:CONTRIBUTES_TO]->(impulseRegulation)
SET r_contributes_impulse.relationshipId = "rel_self_control_contributes_to_impulse_regulation",
r_contributes_impulse.description = "Öz denetim, dürtüsel davranışların bağlama ve hedefe göre düzenlenmesine katkı sağlayan bilişsel süreç olarak temsil edilmiştir.",
r_contributes_impulse.sourceKey = "bari2013inhibition",
r_contributes_impulse.doi = "10.1016/j.pneurobio.2013.06.005",
r_contributes_impulse.sourceUri = "https://doi.org/10.1016/j.pneurobio.2013.06.005",
r_contributes_impulse.evidenceNote = "Inhibition ve impulsivity arasındaki davranışsal ve nöral ilişkiyi desteklemek için kullanılmıştır.";

MATCH (impulseRegulation:BehaviorPattern {nodeId: "behaviorpattern_impulse_regulation"})
MATCH (exampleDelayPurchase:BehaviorExample {nodeId: "behaviorexample_delaying_impulsive_purchase"})
MERGE (impulseRegulation)-[r_example_purchase:HAS_EXAMPLE]->(exampleDelayPurchase)
SET r_example_purchase.relationshipId = "rel_impulse_regulation_has_example_delaying_impulsive_purchase",
r_example_purchase.description = "Dürtüsel satın almayı erteleme davranışı, dürtü düzenleme örneği olarak modellenmiştir.";

MATCH (impulseRegulation:BehaviorPattern {nodeId: "behaviorpattern_impulse_regulation"})
MATCH (exampleStopReply:BehaviorExample {nodeId: "behaviorexample_stopping_automatic_reply"})
MERGE (impulseRegulation)-[r_example_reply:HAS_EXAMPLE]->(exampleStopReply)
SET r_example_reply.relationshipId = "rel_impulse_regulation_has_example_stopping_automatic_reply",
r_example_reply.description = "Otomatik yanıtı durdurma davranışı, dürtü düzenleme örneği olarak modellenmiştir.";

MATCH (impulseRegulation:BehaviorPattern {nodeId: "behaviorpattern_impulse_regulation"})
MATCH (exampleResistPhone:BehaviorExample {nodeId: "behaviorexample_resisting_phone_checking"})
MERGE (impulseRegulation)-[r_example_phone:HAS_EXAMPLE]->(exampleResistPhone)
SET r_example_phone.relationshipId = "rel_impulse_regulation_has_example_resisting_phone_checking",
r_example_phone.description = "Çalışırken telefonu kontrol etme isteğine direnme davranışı, dürtü düzenleme örneği olarak modellenmiştir.";




// GÖRSELLEŞTİRME SORGUSU

MATCH mainPath =
(:BrainRegion {nodeId: "brainregion_prefrontal_cortex"})
-[:RELEASES]->(:Neurochemical {nodeId: "neurochemical_gaba"})
-[:MODULATES]->(:BrainRegion {nodeId: "brainregion_right_inferior_frontal_gyrus"})
-[:INVOLVED_IN]->(:CognitiveProcess {nodeId: "cognitiveprocess_response_inhibition"})
-[:REGULATES]->(:CognitiveProcess {nodeId: "cognitiveprocess_self_control"})
-[:CONTRIBUTES_TO]->(:BehaviorPattern {nodeId: "behaviorpattern_impulse_regulation"})

MATCH examplePath =
(:BehaviorPattern {nodeId: "behaviorpattern_impulse_regulation"})
-[:HAS_EXAMPLE]->(:BehaviorExample)

RETURN mainPath, examplePath;