// 04 - ALIŞKANLIK OLUŞUMU MVP'si

// 1. TÜM NODE'LAR

MERGE (snc:BrainRegion {nodeId: "brainregion_substantia_nigra_pars_compacta"})
SET snc.name = "Substantia Nigra Pars Compacta",
snc.turkishName = "Substantia nigra pars compacta",
snc.description = "Nigrostriatal dopamin sistemi içinde dopaminerjik nöronları içeren ve dorsal striatuma dopaminerjik girdi sağlayan beyin bölgesidir.",
snc.ontologySource = "Uberon",
snc.ontologyId = "UBERON:0001965",
snc.sourceUri = "http://purl.obolibrary.org/obo/UBERON_0001965",
snc.ontologyMappingType = "EXACT_MATCH";

MERGE (dopamine:Neurochemical {nodeId: "neurochemical_dopamine"})
SET dopamine.name = "Dopamine",
dopamine.turkishName = "Dopamin",
dopamine.description = "Ödül, öğrenme, eylem seçimi ve alışkanlık oluşumuyla ilişkili nörokimyasal öğedir.",
dopamine.ontologySource = "ChEBI",
dopamine.ontologyId = "CHEBI:18243",
dopamine.sourceUri = "http://purl.obolibrary.org/obo/CHEBI_18243",
dopamine.ontologyMappingType = "EXACT_MATCH";

MERGE (dorsalStriatum:BrainRegion {nodeId: "brainregion_dorsal_striatum"})
SET dorsalStriatum.name = "Dorsal Striatum",
dorsalStriatum.turkishName = "Dorsal striatum",
dorsalStriatum.description = "Alışkanlık öğrenimi, eylem seçimi ve uyaran-tepki ilişkileriyle bağlantılı striatal yapıdır.",
dorsalStriatum.ontologySource = "Uberon",
dorsalStriatum.ontologyId = "UBERON:0005382",
dorsalStriatum.sourceUri = "http://purl.obolibrary.org/obo/UBERON_0005382",
dorsalStriatum.ontologyMappingType = "EXACT_MATCH";

MERGE (srLearning:CognitiveProcess {nodeId: "cognitiveprocess_stimulus_response_learning"})
SET srLearning.name = "Stimulus-Response Learning",
srLearning.turkishName = "Uyaran-tepki öğrenmesi",
srLearning.description = "Belirli uyaranlar ile belirli davranışsal tepkiler arasında tekrar yoluyla bağlantı kurulmasını ifade eden öğrenme sürecidir.",
srLearning.ontologySource = "Literature-based local concept",
srLearning.ontologyId = "local:stimulus_response_learning",
srLearning.sourceUri = "local:stimulus_response_learning",
srLearning.ontologyMappingType = "LITERATURE_BASED_LOCAL_CONCEPT";

MERGE (habitFormation:CognitiveProcess {nodeId: "cognitiveprocess_habit_formation"})
SET habitFormation.name = "Habit Formation",
habitFormation.turkishName = "Alışkanlık oluşumu",
habitFormation.description = "Tekrar eden davranışların zamanla daha otomatik ve bağlama duyarlı davranış örüntülerine dönüşmesi sürecidir.",
habitFormation.ontologySource = "Literature-based local concept",
habitFormation.ontologyId = "local:habit_formation",
habitFormation.sourceUri = "local:habit_formation",
habitFormation.ontologyMappingType = "LITERATURE_BASED_LOCAL_CONCEPT";

MERGE (habitualBehavior:BehaviorPattern {nodeId: "behaviorpattern_habitual_behavior"})
SET habitualBehavior.name = "Habitual Behavior",
habitualBehavior.turkishName = "Alışkanlığa dayalı davranış",
habitualBehavior.description = "Belirli ipuçları veya bağlamlar tarafından tetiklenen, tekrar yoluyla kazanılmış ve çoğu zaman otomatikleşmiş davranış örüntüsüdür.",
habitualBehavior.ontologySource = "Cognitive Atlas / behavior-oriented ontology mapping",
habitualBehavior.ontologyId = "trm_4a3fd79d0a483",
habitualBehavior.sourceUri = "https://www.cognitiveatlas.org/concept/id/trm_4a3fd79d0a483/",
habitualBehavior.ontologyMappingType = "CLOSE_MATCH";

MERGE (phoneExample:BehaviorExample {nodeId: "behaviorexample_checking_phone_automatically"})
SET phoneExample.name = "Checking the Phone Automatically",
phoneExample.turkishName = "Telefonu otomatik olarak kontrol etmek",
phoneExample.description = "Bireyin belirli bir bildirim olmasa bile telefonu tekrar eden biçimde kontrol etmesidir.";

MERGE (coffeeExample:BehaviorExample {nodeId: "behaviorexample_morning_coffee_routine"})
SET coffeeExample.name = "Following a Morning Coffee Routine",
coffeeExample.turkishName = "Sabah kahvesi rutinini sürdürmek",
coffeeExample.description = "Bireyin sabah belirli bir bağlamda otomatikleşmiş kahve hazırlama veya kahve içme davranışı göstermesidir.";

MERGE (routeExample:BehaviorExample {nodeId: "behaviorexample_taking_same_route"})
SET routeExample.name = "Taking the Same Route Repeatedly",
routeExample.turkishName = "Aynı rotayı tekrar tekrar kullanmak",
routeExample.description = "Bireyin belirli bir hedefe giderken bilinçli seçim yapmadan alıştığı rotayı kullanmasıdır.";




// 2. TÜM İLİŞKİLER

MATCH (snc:BrainRegion {nodeId: "brainregion_substantia_nigra_pars_compacta"})
MATCH (dopamine:Neurochemical {nodeId: "neurochemical_dopamine"})
MERGE (snc)-[r_releases_dopamine:RELEASES]->(dopamine)
SET r_releases_dopamine.relationshipId = "rel_snc_releases_dopamine_habit",
r_releases_dopamine.description = "Substantia nigra pars compacta, Alışkanlık Oluşumu MVP'sinde dopaminerjik nöronları içeren kaynak beyin bölgesi olarak temsil edilmiştir.",
r_releases_dopamine.sourceKey = "bourdy2014control",
r_releases_dopamine.doi = "10.3389/fnsys.2014.00162",
r_releases_dopamine.sourceUri = "https://doi.org/10.3389/fnsys.2014.00162",
r_releases_dopamine.evidenceNote = "Nigrostriatal yolun substantia nigra pars compacta dopamin nöronlarından dorsal striatuma uzandığını desteklemek için kullanılmıştır.";

MATCH (dopamine:Neurochemical {nodeId: "neurochemical_dopamine"})
MATCH (dorsalStriatum:BrainRegion {nodeId: "brainregion_dorsal_striatum"})
MERGE (dopamine)-[r_modulates_striatum:MODULATES]->(dorsalStriatum)
SET r_modulates_striatum.relationshipId = "rel_dopamine_modulates_dorsal_striatum_habit",
r_modulates_striatum.description = "Dopamin, dorsal striatumdaki öğrenme ve eylem seçimi süreçlerini düzenleyen nörokimyasal öğe olarak temsil edilmiştir.",
r_modulates_striatum.sourceKey = "yin2006basalganglia",
r_modulates_striatum.doi = "10.1038/nrn1919",
r_modulates_striatum.sourceUri = "https://doi.org/10.1038/nrn1919",
r_modulates_striatum.evidenceNote = "Basal ganglia ve striatal mekanizmaların alışkanlık oluşumundaki rolünü desteklemek için kullanılmıştır.";

MATCH (dorsalStriatum:BrainRegion {nodeId: "brainregion_dorsal_striatum"})
MATCH (srLearning:CognitiveProcess {nodeId: "cognitiveprocess_stimulus_response_learning"})
MERGE (dorsalStriatum)-[r_involved_sr_learning:INVOLVED_IN]->(srLearning)
SET r_involved_sr_learning.relationshipId = "rel_dorsal_striatum_involved_in_stimulus_response_learning",
r_involved_sr_learning.description = "Dorsal striatum, uyaran-tepki öğrenmesi sürecinde rol alan nöroanatomik yapı olarak temsil edilmiştir.",
r_involved_sr_learning.sourceKey = "balleine2010actioncontrol",
r_involved_sr_learning.doi = "10.1038/npp.2009.131",
r_involved_sr_learning.sourceUri = "https://doi.org/10.1038/npp.2009.131",
r_involved_sr_learning.evidenceNote = "Hedefe yönelik ve alışkanlığa dayalı eylem ayrımında kortikostriatal sistemlerin rolünü desteklemek için kullanılmıştır.";

MATCH (srLearning:CognitiveProcess {nodeId: "cognitiveprocess_stimulus_response_learning"})
MATCH (habitFormation:CognitiveProcess {nodeId: "cognitiveprocess_habit_formation"})
MERGE (srLearning)-[r_regulates_habit_formation:REGULATES]->(habitFormation)
SET r_regulates_habit_formation.relationshipId = "rel_stimulus_response_learning_regulates_habit_formation",
r_regulates_habit_formation.description = "Uyaran-tepki öğrenmesi, tekrar yoluyla alışkanlık oluşumunu düzenleyen bilişsel süreç olarak temsil edilmiştir.",
r_regulates_habit_formation.sourceKey = "balleine2010actioncontrol",
r_regulates_habit_formation.doi = "10.1038/npp.2009.131",
r_regulates_habit_formation.sourceUri = "https://doi.org/10.1038/npp.2009.131",
r_regulates_habit_formation.evidenceNote = "Alışkanlığa dayalı eylem oluşumunda uyaran-tepki öğrenme süreçlerinin rolünü desteklemek için kullanılmıştır.";

MATCH (habitFormation:CognitiveProcess {nodeId: "cognitiveprocess_habit_formation"})
MATCH (habitualBehavior:BehaviorPattern {nodeId: "behaviorpattern_habitual_behavior"})
MERGE (habitFormation)-[r_contributes_habitual_behavior:CONTRIBUTES_TO]->(habitualBehavior)
SET r_contributes_habitual_behavior.relationshipId = "rel_habit_formation_contributes_to_habitual_behavior",
r_contributes_habitual_behavior.description = "Alışkanlık oluşumu, davranışsal düzeyde alışkanlığa dayalı davranışların ortaya çıkmasına katkı sağlayan süreç olarak temsil edilmiştir.",
r_contributes_habitual_behavior.sourceKey = "smith2016habitformation",
r_contributes_habitual_behavior.doi = "10.31887/DCNS.2016.18.1/ksmith",
r_contributes_habitual_behavior.sourceUri = "https://doi.org/10.31887/DCNS.2016.18.1/ksmith",
r_contributes_habitual_behavior.evidenceNote = "Alışkanlık oluşumunun davranışsal otomatikleşme ve eylem parçalama/bütünleme süreçleriyle ilişkisini desteklemek için kullanılmıştır.";

MATCH (habitualBehavior:BehaviorPattern {nodeId: "behaviorpattern_habitual_behavior"})
MATCH (phoneExample:BehaviorExample {nodeId: "behaviorexample_checking_phone_automatically"})
MERGE (habitualBehavior)-[r_example_phone:HAS_EXAMPLE]->(phoneExample)
SET r_example_phone.relationshipId = "rel_habitual_behavior_has_example_checking_phone_automatically",
r_example_phone.description = "Telefonu otomatik olarak kontrol etme davranışı, alışkanlığa dayalı davranış örneği olarak modellenmiştir.";

MATCH (habitualBehavior:BehaviorPattern {nodeId: "behaviorpattern_habitual_behavior"})
MATCH (coffeeExample:BehaviorExample {nodeId: "behaviorexample_morning_coffee_routine"})
MERGE (habitualBehavior)-[r_example_coffee:HAS_EXAMPLE]->(coffeeExample)
SET r_example_coffee.relationshipId = "rel_habitual_behavior_has_example_morning_coffee_routine",
r_example_coffee.description = "Sabah kahvesi rutinini sürdürme davranışı, alışkanlığa dayalı davranış örneği olarak modellenmiştir.";

MATCH (habitualBehavior:BehaviorPattern {nodeId: "behaviorpattern_habitual_behavior"})
MATCH (routeExample:BehaviorExample {nodeId: "behaviorexample_taking_same_route"})
MERGE (habitualBehavior)-[r_example_route:HAS_EXAMPLE]->(routeExample)
SET r_example_route.relationshipId = "rel_habitual_behavior_has_example_taking_same_route",
r_example_route.description = "Aynı rotayı tekrar tekrar kullanma davranışı, alışkanlığa dayalı davranış örneği olarak modellenmiştir.";




// GÖRSELLEŞTİRME SORGUSU

MATCH mainPath =
(:BrainRegion {nodeId: "brainregion_substantia_nigra_pars_compacta"})
-[:RELEASES]->(:Neurochemical {nodeId: "neurochemical_dopamine"})
-[:MODULATES]->(:BrainRegion {nodeId: "brainregion_dorsal_striatum"})
-[:INVOLVED_IN]->(:CognitiveProcess {nodeId: "cognitiveprocess_stimulus_response_learning"})
-[:REGULATES]->(:CognitiveProcess {nodeId: "cognitiveprocess_habit_formation"})
-[:CONTRIBUTES_TO]->(:BehaviorPattern {nodeId: "behaviorpattern_habitual_behavior"})

MATCH examplePath =
(:BehaviorPattern {nodeId: "behaviorpattern_habitual_behavior"})
-[:HAS_EXAMPLE]->(:BehaviorExample)

RETURN mainPath, examplePath;