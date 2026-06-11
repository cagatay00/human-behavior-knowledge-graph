// 03 - MERAK VE KEŞİF MVP'si

// NODES

MERGE (vta:BrainRegion {nodeId: "brainregion_ventral_tegmental_area"})
SET vta.name = "Ventral Tegmental Area",
vta.turkishName = "Ventral tegmental alan",
vta.description = "Dopaminerjik sinyal üretimi açısından önemli olan ve motivasyon, ödül ve keşif süreçleriyle ilişkili beyin bölgesidir.",
vta.ontologySource = "Uberon",
vta.ontologyId = "UBERON:0002691",
vta.sourceUri = "http://purl.obolibrary.org/obo/UBERON_0002691",
vta.ontologyMappingType = "EXACT_MATCH";

MERGE (dopamine:Neurochemical {nodeId: "neurochemical_dopamine"})
SET dopamine.name = "Dopamine",
dopamine.turkishName = "Dopamin",
dopamine.description = "Ödül, motivasyon, öğrenme ve yenilik süreçlerinde rol alan katekolamin türü nörokimyasal maddedir.",
dopamine.ontologySource = "ChEBI",
dopamine.ontologyId = "CHEBI:18243",
dopamine.sourceUri = "http://purl.obolibrary.org/obo/CHEBI_18243",
dopamine.ontologyMappingType = "EXACT_MATCH";

MERGE (hippocampus:BrainRegion {nodeId: "brainregion_hippocampus"})
SET hippocampus.name = "Hippocampus",
hippocampus.turkishName = "Hipokampus",
hippocampus.description = "Öğrenme, bellek ve yeni uyaranların işlenmesiyle ilişkili beyin bölgesidir.",
hippocampus.ontologySource = "Uberon",
hippocampus.ontologyId = "UBERON:0002421",
hippocampus.sourceUri = "http://purl.obolibrary.org/obo/UBERON_0002421",
hippocampus.ontologyMappingType = "EXACT_MATCH";

MERGE (novelty:CognitiveProcess {nodeId: "cognitiveprocess_novelty_processing"})
SET novelty.name = "Novelty Processing",
novelty.turkishName = "Yenilik işleme",
novelty.description = "Yeni, beklenmedik veya daha önce karşılaşılmamış uyaranların bilişsel olarak işlenmesi sürecidir.",
novelty.ontologySource = "Literature-based local concept",
novelty.ontologyId = "local:novelty_processing",
novelty.sourceUri = "local:novelty_processing",
novelty.ontologyMappingType = "LITERATURE_BASED_LOCAL_CONCEPT";

MERGE (curiosity:CognitiveProcess {nodeId: "cognitiveprocess_curiosity"})
SET curiosity.name = "Curiosity",
curiosity.turkishName = "Merak",
curiosity.description = "Bireyin bilgi eksikliğini azaltma, yeni bilgiye yönelme ve bilinmeyen durumları anlama eğilimini temsil eden bilişsel süreçtir.",
curiosity.ontologySource = "Cognitive Atlas",
curiosity.ontologyId = "trm_4f3bdeedcc99d",
curiosity.sourceUri = "https://www.cognitiveatlas.org/concept/id/trm_4f3bdeedcc99d/",
curiosity.ontologyMappingType = "EXACT_MATCH";

MERGE (exploration:BehaviorPattern {nodeId: "behaviorpattern_exploratory_behavior"})
SET exploration.name = "Exploratory Behavior",
exploration.turkishName = "Keşfedici davranış",
exploration.description = "Bireyin yeni bir çevreyi araştırma, yeni seçenekleri deneme ve bilgi edinmeye yönelik davranışlar sergileme eğilimini temsil eden davranış örüntüsüdür.",
exploration.ontologySource = "Experimental Factor Ontology",
exploration.ontologyId = "EFO:0004316",
exploration.sourceUri = "http://www.ebi.ac.uk/efo/EFO_0004316",
exploration.ontologyMappingType = "EXACT_MATCH";

MERGE (readingExample:BehaviorExample {nodeId: "behaviorexample_reading_unfamiliar_topic"})
SET readingExample.name = "Reading About an Unfamiliar Topic",
readingExample.turkishName = "Bilinmeyen bir konu hakkında okuma yapmak",
readingExample.description = "Bireyin merak duyduğu yeni bir konu hakkında bilgi edinmek için okuma veya araştırma yapmasıdır.";

MERGE (environmentExample:BehaviorExample {nodeId: "behaviorexample_exploring_new_environment"})
SET environmentExample.name = "Exploring a New Environment",
environmentExample.turkishName = "Yeni bir çevreyi keşfetmek",
environmentExample.description = "Bireyin daha önce bulunmadığı bir ortamı incelemesi ve çevresel ipuçlarını araştırmasıdır.";

MERGE (optionExample:BehaviorExample {nodeId: "behaviorexample_trying_unknown_option"})
SET optionExample.name = "Trying an Unknown Option",
optionExample.turkishName = "Bilinmeyen bir seçeneği denemek",
optionExample.description = "Bireyin sonucu kesin olmayan yeni bir seçeneği deneyerek bilgi edinmeye çalışmasıdır.";


// RELATIONSHIPS

MATCH (vta:BrainRegion {nodeId: "brainregion_ventral_tegmental_area"})
MATCH (dopamine:Neurochemical {nodeId: "neurochemical_dopamine"})
MERGE (vta)-[r_releases:RELEASES]->(dopamine)
SET r_releases.relationshipId = "rel_vta_releases_dopamine_curiosity",
r_releases.description = "Ventral tegmental alan, Merak ve Keşif MVP'sinde dopamin için temel kaynak beyin bölgesi olarak temsil edilmiştir.",
r_releases.sourceKey = "gruber2014curiosity",
r_releases.doi = "10.1016/j.neuron.2014.08.060",
r_releases.sourceUri = "https://doi.org/10.1016/j.neuron.2014.08.060",
r_releases.evidenceNote = "Merak, dopaminerjik devre ve hipokampüse bağlı öğrenme ilişkisini desteklemek için kullanılmıştır.";

MATCH (dopamine:Neurochemical {nodeId: "neurochemical_dopamine"})
MATCH (hippocampus:BrainRegion {nodeId: "brainregion_hippocampus"})
MERGE (dopamine)-[r_modulates_hippocampus:MODULATES]->(hippocampus)
SET r_modulates_hippocampus.relationshipId = "rel_dopamine_modulates_hippocampus_curiosity",
r_modulates_hippocampus.description = "Dopamin, hipokampus ile ilişkili öğrenme ve yenilik süreçlerini düzenleyici nörokimyasal öğe olarak temsil edilmiştir.",
r_modulates_hippocampus.sourceKey = "gruber2014curiosity",
r_modulates_hippocampus.doi = "10.1016/j.neuron.2014.08.060",
r_modulates_hippocampus.sourceUri = "https://doi.org/10.1016/j.neuron.2014.08.060",
r_modulates_hippocampus.evidenceNote = "Merak durumlarının hipokampüse bağlı öğrenme ile dopaminerjik devre üzerinden ilişkili olduğunu desteklemektedir.";

MATCH (hippocampus:BrainRegion {nodeId: "brainregion_hippocampus"})
MATCH (novelty:CognitiveProcess {nodeId: "cognitiveprocess_novelty_processing"})
MERGE (hippocampus)-[r_involved_novelty:INVOLVED_IN]->(novelty)
SET r_involved_novelty.relationshipId = "rel_hippocampus_involved_in_novelty_processing",
r_involved_novelty.description = "Hipokampus, yeni uyaranların işlenmesi sürecinde rol alan beyin bölgesi olarak temsil edilmiştir.",
r_involved_novelty.sourceKey = "kafkas2018novelty",
r_involved_novelty.doi = "10.1016/j.neulet.2018.01.053",
r_involved_novelty.sourceUri = "https://doi.org/10.1016/j.neulet.2018.01.053",
r_involved_novelty.evidenceNote = "Bellek sistemleri ve yenilik algılama ilişkisini desteklemek için kullanılmıştır.";

MATCH (novelty:CognitiveProcess {nodeId: "cognitiveprocess_novelty_processing"})
MATCH (curiosity:CognitiveProcess {nodeId: "cognitiveprocess_curiosity"})
MERGE (novelty)-[r_regulates_curiosity:REGULATES]->(curiosity)
SET r_regulates_curiosity.relationshipId = "rel_novelty_processing_regulates_curiosity",
r_regulates_curiosity.description = "Yenilik işleme süreci, merakın oluşumu ve güçlenmesi üzerinde etkili bilişsel süreç olarak temsil edilmiştir.",
r_regulates_curiosity.sourceKey = "kidd2015curiosity",
r_regulates_curiosity.doi = "10.1016/j.neuron.2015.09.010",
r_regulates_curiosity.sourceUri = "https://doi.org/10.1016/j.neuron.2015.09.010",
r_regulates_curiosity.evidenceNote = "Merakın bilgi edinme, öğrenme ve karar verme süreçleriyle ilişkisini desteklemek için kullanılmıştır.";

MATCH (curiosity:CognitiveProcess {nodeId: "cognitiveprocess_curiosity"})
MATCH (exploration:BehaviorPattern {nodeId: "behaviorpattern_exploratory_behavior"})
MERGE (curiosity)-[r_contributes_exploration:CONTRIBUTES_TO]->(exploration)
SET r_contributes_exploration.relationshipId = "rel_curiosity_contributes_to_exploratory_behavior",
r_contributes_exploration.description = "Merak, keşfedici davranışın ortaya çıkmasına katkı sağlayan bilişsel süreç olarak temsil edilmiştir.",
r_contributes_exploration.sourceKey = "kidd2015curiosity",
r_contributes_exploration.doi = "10.1016/j.neuron.2015.09.010",
r_contributes_exploration.sourceUri = "https://doi.org/10.1016/j.neuron.2015.09.010",
r_contributes_exploration.evidenceNote = "Merakın bilgi arama ve keşif davranışlarıyla ilişkisini desteklemek için kullanılmıştır.";

MATCH (exploration:BehaviorPattern {nodeId: "behaviorpattern_exploratory_behavior"})
MATCH (readingExample:BehaviorExample {nodeId: "behaviorexample_reading_unfamiliar_topic"})
MERGE (exploration)-[r_example_reading:HAS_EXAMPLE]->(readingExample)
SET r_example_reading.relationshipId = "rel_exploratory_behavior_has_example_reading_unfamiliar_topic",
r_example_reading.description = "Bilinmeyen bir konu hakkında okuma davranışı, keşfedici davranış örneği olarak modellenmiştir.";

MATCH (exploration:BehaviorPattern {nodeId: "behaviorpattern_exploratory_behavior"})
MATCH (environmentExample:BehaviorExample {nodeId: "behaviorexample_exploring_new_environment"})
MERGE (exploration)-[r_example_environment:HAS_EXAMPLE]->(environmentExample)
SET r_example_environment.relationshipId = "rel_exploratory_behavior_has_example_exploring_new_environment",
r_example_environment.description = "Yeni bir çevreyi keşfetme davranışı, keşfedici davranış örneği olarak modellenmiştir.";

MATCH (exploration:BehaviorPattern {nodeId: "behaviorpattern_exploratory_behavior"})
MATCH (optionExample:BehaviorExample {nodeId: "behaviorexample_trying_unknown_option"})
MERGE (exploration)-[r_example_option:HAS_EXAMPLE]->(optionExample)
SET r_example_option.relationshipId = "rel_exploratory_behavior_has_example_trying_unknown_option",
r_example_option.description = "Bilinmeyen bir seçeneği deneme davranışı, keşfedici davranış örneği olarak modellenmiştir.";


// GÖRSELLEŞTİRME SORGUSU

MATCH mainPath =
(:BrainRegion {nodeId: "brainregion_ventral_tegmental_area"})
-[:RELEASES]->(:Neurochemical {nodeId: "neurochemical_dopamine"})
-[:MODULATES]->(:BrainRegion {nodeId: "brainregion_hippocampus"})
-[:INVOLVED_IN]->(:CognitiveProcess {nodeId: "cognitiveprocess_novelty_processing"})
-[:REGULATES]->(:CognitiveProcess {nodeId: "cognitiveprocess_curiosity"})
-[:CONTRIBUTES_TO]->(:BehaviorPattern {nodeId: "behaviorpattern_exploratory_behavior"})

MATCH examplePath =
(:BehaviorPattern {nodeId: "behaviorpattern_exploratory_behavior"})
-[:HAS_EXAMPLE]->(:BehaviorExample)

RETURN mainPath, examplePath;