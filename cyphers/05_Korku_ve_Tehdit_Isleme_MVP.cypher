// 05 - KORKU VE TEHDİT İŞLEME MVP'si

// 1) TÜM NODE'LAR

MERGE (bla:BrainRegion {nodeId: "brainregion_basolateral_amygdala"})
SET bla.name = "Basolateral Amygdala",
bla.turkishName = "Basolateral amigdala",
bla.description = "Amigdalanin korku ogrenimi, korku ifadesi ve yerel inhibitor devrelerle iliskili basolateral bolgesidir.",
bla.ontologySource = "Uberon",
bla.ontologyId = "UBERON:0006107",
bla.sourceUri = "http://purl.obolibrary.org/obo/UBERON_0006107",
bla.ontologyMappingType = "EXACT_MATCH";

MERGE (gaba:Neurochemical {nodeId: "neurochemical_gaba"})
SET gaba.name = "GABA",
gaba.turkishName = "GABA",
gaba.description = "Merkezi sinir sisteminde inhibitor duzenleme ile iliskili temel norokimyasal ogedir.",
gaba.ontologySource = "ChEBI",
gaba.ontologyId = "CHEBI:16865",
gaba.sourceUri = "http://purl.obolibrary.org/obo/CHEBI_16865",
gaba.ontologyMappingType = "EXACT_MATCH";

MERGE (amygdala:BrainRegion {nodeId: "brainregion_amygdala"})
SET amygdala.name = "Amygdala",
amygdala.turkishName = "Amigdala",
amygdala.description = "Tehdit, duygusal onem ve korku ile iliskili uyaranlarin islenmesinde rol alan limbik beyin bolgesidir.",
amygdala.ontologySource = "Uberon",
amygdala.ontologyId = "UBERON:0001876",
amygdala.sourceUri = "http://purl.obolibrary.org/obo/UBERON_0001876",
amygdala.ontologyMappingType = "EXACT_MATCH";

MERGE (threatProcessing:CognitiveProcess {nodeId: "cognitiveprocess_threat_processing"})
SET threatProcessing.name = "Threat Processing",
threatProcessing.turkishName = "Tehdit isleme",
threatProcessing.description = "Cevredeki potansiyel tehlike uyaranlarinin algilanmasi, degerlendirilmesi ve savunma yanitlariyla iliskilendirilmesi surecidir.",
threatProcessing.ontologySource = "Literature-based local concept",
threatProcessing.ontologyId = "local:threat_processing",
threatProcessing.sourceUri = "local:threat_processing",
threatProcessing.ontologyMappingType = "LITERATURE_BASED_LOCAL_CONCEPT";

MERGE (fear:CognitiveProcess {nodeId: "cognitiveprocess_fear"})
SET fear.name = "Fear",
fear.turkishName = "Korku",
fear.description = "Gercek ya da algilanan tehdide karsi ortaya cikan olumsuz duygusal ve bilissel durumdur.",
fear.ontologySource = "Cognitive Atlas",
fear.ontologyId = "trm_4a3fd79d0b689",
fear.sourceUri = "https://www.cognitiveatlas.org/concept/id/trm_4a3fd79d0b689/",
fear.ontologyMappingType = "EXACT_MATCH";

MERGE (avoidanceBehavior:BehaviorPattern {nodeId: "behaviorpattern_avoidance_behavior"})
SET avoidanceBehavior.name = "Avoidance Behavior",
avoidanceBehavior.turkishName = "Kacinma davranisi",
avoidanceBehavior.description = "Tehdit veya olumsuz sonuc beklentisiyle bir uyaran, ortam veya eylemden uzak durma egilimini temsil eden davranis oruntusudur.",
avoidanceBehavior.ontologySource = "BCIO / Human Behaviour Ontology and NBO-supported local mapping",
avoidanceBehavior.ontologyId = "local:avoidance_behavior",
avoidanceBehavior.sourceUri = "local:avoidance_behavior",
avoidanceBehavior.ontologyMappingType = "LITERATURE_BASED_LOCAL_CONCEPT";

MERGE (freezingExample:BehaviorExample {nodeId: "behaviorexample_freezing_response"})
SET freezingExample.name = "Freezing Response",
freezingExample.turkishName = "Donma tepkisi",
freezingExample.description = "Bireyin tehdit algisi karsisinda hareketini gecici olarak baskilamasi veya savunmaci bicimde donakalmasidir.";

MERGE (avoidanceExample:BehaviorExample {nodeId: "behaviorexample_threat_avoidance"})
SET avoidanceExample.name = "Threat Avoidance",
avoidanceExample.turkishName = "Tehditten uzaklasma",
avoidanceExample.description = "Bireyin tehdit olarak algiladigi uyaran, ortam veya durumdan uzaklasmasidir.";

MERGE (vigilanceExample:BehaviorExample {nodeId: "behaviorexample_increased_vigilance"})
SET vigilanceExample.name = "Increased Vigilance",
vigilanceExample.turkishName = "Artmis tetikte olma",
vigilanceExample.description = "Bireyin potansiyel tehlikelere karsi dikkat ve cevresel izleme duzeyini artirmasidir.";





// 2) TÜM İLİŞKİLER


MATCH (bla:BrainRegion {nodeId: "brainregion_basolateral_amygdala"})
MATCH (gaba:Neurochemical {nodeId: "neurochemical_gaba"})
MERGE (bla)-[r_releases_gaba:RELEASES]->(gaba)
SET r_releases_gaba.relationshipId = "rel_basolateral_amygdala_releases_gaba_fear_threat",
r_releases_gaba.description = "Basolateral amigdala icindeki GABAerjik inhibitor devreler, GABA aracili yerel duzenleme kaynagi olarak temsil edilmistir.",
r_releases_gaba.sourceKey = "krabbe2018amygdala",
r_releases_gaba.doi = "10.1016/j.biopsych.2017.10.006",
r_releases_gaba.sourceUri = "https://doi.org/10.1016/j.biopsych.2017.10.006",
r_releases_gaba.evidenceNote = "Bu iliski, basolateral amigdalanin butun olarak homojen bir salgi kaynagi oldugunu degil, bu bolgedeki GABAerjik interneuronlarin GABA aracili inhibitor etkisini temsil eder.";

MATCH (gaba:Neurochemical {nodeId: "neurochemical_gaba"})
MATCH (amygdala:BrainRegion {nodeId: "brainregion_amygdala"})
MERGE (gaba)-[r_modulates_amygdala:MODULATES]->(amygdala)
SET r_modulates_amygdala.relationshipId = "rel_gaba_modulates_amygdala_fear_threat",
r_modulates_amygdala.description = "GABA, amigdala devrelerinde inhibitor duzenleyici norokimyasal oge olarak temsil edilmistir.",
r_modulates_amygdala.sourceKey = "duvarci2014amygdala",
r_modulates_amygdala.doi = "10.1016/j.neuron.2014.04.042",
r_modulates_amygdala.sourceUri = "https://doi.org/10.1016/j.neuron.2014.04.042",
r_modulates_amygdala.evidenceNote = "Amigdala mikrodevrelerinde inhibitor duzenlemenin korku ogrenimi ve korku ifadesiyle iliskisini desteklemek icin kullanilmistir.";

MATCH (amygdala:BrainRegion {nodeId: "brainregion_amygdala"})
MATCH (threatProcessing:CognitiveProcess {nodeId: "cognitiveprocess_threat_processing"})
MERGE (amygdala)-[r_involved_threat:INVOLVED_IN]->(threatProcessing)
SET r_involved_threat.relationshipId = "rel_amygdala_involved_in_threat_processing",
r_involved_threat.description = "Amigdala, tehdit ve duygusal onem tasiyan uyaranlarin islenmesinde rol alan beyin bolgesi olarak temsil edilmistir.",
r_involved_threat.sourceKey = "phelps2005amygdala",
r_involved_threat.doi = "10.1016/j.neuron.2005.09.025",
r_involved_threat.sourceUri = "https://doi.org/10.1016/j.neuron.2005.09.025",
r_involved_threat.evidenceNote = "Amigdalanin duygu isleme ve tehdit ile iliskili uyaranlarin degerlendirilmesindeki rolunu desteklemek icin kullanilmistir.";

MATCH (threatProcessing:CognitiveProcess {nodeId: "cognitiveprocess_threat_processing"})
MATCH (fear:CognitiveProcess {nodeId: "cognitiveprocess_fear"})
MERGE (threatProcessing)-[r_regulates_fear:REGULATES]->(fear)
SET r_regulates_fear.relationshipId = "rel_threat_processing_regulates_fear",
r_regulates_fear.description = "Tehdit isleme sureci, korku durumunun ortaya cikmasi ve bicimlenmesiyle iliskili bilissel surec olarak temsil edilmistir.",
r_regulates_fear.sourceKey = "tovote2015fearanxiety",
r_regulates_fear.doi = "10.1038/nrn3945",
r_regulates_fear.sourceUri = "https://doi.org/10.1038/nrn3945",
r_regulates_fear.evidenceNote = "Korku ve anksiyete devrelerinin tehdit degerlendirmesi ve savunma yanitlarini nasil organize ettigini desteklemek icin kullanilmistir.";

MATCH (fear:CognitiveProcess {nodeId: "cognitiveprocess_fear"})
MATCH (avoidanceBehavior:BehaviorPattern {nodeId: "behaviorpattern_avoidance_behavior"})
MERGE (fear)-[r_contributes_avoidance:CONTRIBUTES_TO]->(avoidanceBehavior)
SET r_contributes_avoidance.relationshipId = "rel_fear_contributes_to_avoidance_behavior",
r_contributes_avoidance.description = "Korku, tehditten uzaklasma ve kacinma davranisina katkida bulunan bilissel surec olarak temsil edilmistir.",
r_contributes_avoidance.sourceKey = "davis2001amygdala",
r_contributes_avoidance.doi = "10.1038/sj.mp.4000812",
r_contributes_avoidance.sourceUri = "https://doi.org/10.1038/sj.mp.4000812",
r_contributes_avoidance.evidenceNote = "Amigdala aracili korku kosullanmasinin tetikte olma, otonom yanit ve savunma davranislariyla iliskisini desteklemek icin kullanilmistir.";

MATCH (avoidanceBehavior:BehaviorPattern {nodeId: "behaviorpattern_avoidance_behavior"})
MATCH (freezingExample:BehaviorExample {nodeId: "behaviorexample_freezing_response"})
MERGE (avoidanceBehavior)-[r_example_freezing:HAS_EXAMPLE]->(freezingExample)
SET r_example_freezing.relationshipId = "rel_avoidance_behavior_has_example_freezing_response",
r_example_freezing.description = "Donma tepkisi, kacinma ve savunma davranisi baglaminda somut davranis ornegi olarak modellenmistir.";

MATCH (avoidanceBehavior:BehaviorPattern {nodeId: "behaviorpattern_avoidance_behavior"})
MATCH (avoidanceExample:BehaviorExample {nodeId: "behaviorexample_threat_avoidance"})
MERGE (avoidanceBehavior)-[r_example_avoidance:HAS_EXAMPLE]->(avoidanceExample)
SET r_example_avoidance.relationshipId = "rel_avoidance_behavior_has_example_threat_avoidance",
r_example_avoidance.description = "Tehditten uzaklasma, kacinma davranisinin somut davranis ornegi olarak modellenmistir.";

MATCH (avoidanceBehavior:BehaviorPattern {nodeId: "behaviorpattern_avoidance_behavior"})
MATCH (vigilanceExample:BehaviorExample {nodeId: "behaviorexample_increased_vigilance"})
MERGE (avoidanceBehavior)-[r_example_vigilance:HAS_EXAMPLE]->(vigilanceExample)
SET r_example_vigilance.relationshipId = "rel_avoidance_behavior_has_example_increased_vigilance",
r_example_vigilance.description = "Artmis tetikte olma, kacinma davranisi baglaminda somut davranis ornegi olarak modellenmistir.";



// GÖRSELLEŞTİRME SORGUSU

MATCH mainPath =
(:BrainRegion {nodeId: "brainregion_basolateral_amygdala"})
-[:RELEASES]->(:Neurochemical {nodeId: "neurochemical_gaba"})
-[:MODULATES]->(:BrainRegion {nodeId: "brainregion_amygdala"})
-[:INVOLVED_IN]->(:CognitiveProcess {nodeId: "cognitiveprocess_threat_processing"})
-[:REGULATES]->(:CognitiveProcess {nodeId: "cognitiveprocess_fear"})
-[:CONTRIBUTES_TO]->(:BehaviorPattern {nodeId: "behaviorpattern_avoidance_behavior"})

MATCH examplePath =
(:BehaviorPattern {nodeId: "behaviorpattern_avoidance_behavior"})
-[:HAS_EXAMPLE]->(:BehaviorExample)

RETURN mainPath, examplePath;