// 01 - ÖDÜL VE MOTİVASYON MVP'si

// NODES

MERGE (vta:BrainRegion {nodeId: "brainregion_vta"})
SET vta.name = "Ventral Tegmental Area",
    vta.turkishName = "Ventral tegmental alan",
    vta.description = "Ödül ve motivasyonla ilişkili devrelerde dopaminerjik sinyal üretimi açısından önemli bir kaynak beyin bölgesidir.",
    vta.ontologySource = "Uberon",
    vta.ontologyId = "UBERON:0002691",
    vta.sourceUri = "http://purl.obolibrary.org/obo/UBERON_0002691",
    vta.ontologyMappingType = "EXACT_MATCH";

MERGE (dopamine:Neurochemical {nodeId: "neurochemical_dopamine"})
SET dopamine.name = "Dopamine",
    dopamine.turkishName = "Dopamin",
    dopamine.description = "Ödül, motivasyon, öğrenme ve hedef beyin bölgelerinin modülasyonu ile ilişkili katekolamin türü bir nörokimyasal maddedir.",
    dopamine.ontologySource = "ChEBI",
    dopamine.ontologyId = "CHEBI:18243",
    dopamine.sourceUri = "http://purl.obolibrary.org/obo/CHEBI_18243",
    dopamine.ontologyMappingType = "EXACT_MATCH";

MERGE (nac:BrainRegion {nodeId: "brainregion_nucleus_accumbens"})
SET nac.name = "Nucleus Accumbens",
    nac.turkishName = "Nucleus accumbens",
    nac.description = "Ödül işleme ve motivasyonla ilişkili davranışlarda rol alan ventral striatum bölgesindeki bir beyin yapısıdır.",
    nac.ontologySource = "Uberon",
    nac.ontologyId = "UBERON:0001882",
    nac.sourceUri = "http://purl.obolibrary.org/obo/UBERON_0001882",
    nac.ontologyMappingType = "EXACT_MATCH";

MERGE (reward:CognitiveProcess {nodeId: "cognitiveprocess_reward_processing"})
SET reward.name = "Reward Processing",
    reward.turkishName = "Ödül işleme",
    reward.description = "Ödüllendirici uyaranların veya sonuçların algılanması, değerlendirilmesi ve bu sonuçlardan öğrenme ile ilişkili bilişsel süreçtir.",
    reward.ontologySource = "Cognitive Atlas",
    reward.ontologyId = "trm_4b6525253c63f",
    reward.sourceUri = "https://www.cognitiveatlas.org/concept/id/trm_4b6525253c63f/",
    reward.ontologyMappingType = "CLOSE_MATCH";

MERGE (motivation:CognitiveProcess {nodeId: "cognitiveprocess_motivation"})
SET motivation.name = "Motivation",
    motivation.turkishName = "Motivasyon",
    motivation.description = "Davranışı hedeflere doğru enerjilendiren, yönlendiren ve sürdürülmesine katkı sağlayan bilişsel ve motivasyonel süreçtir.",
    motivation.ontologySource = "BCIO / Human Behaviour Ontology",
    motivation.ontologyId = "BCIO:006133",
    motivation.sourceUri = "https://www.bciosearch.org/BCIO_006133",
    motivation.ontologyMappingType = "CLOSE_MATCH";

MERGE (gdb:Behavior:BehaviorPattern {nodeId: "behaviorpattern_goal_directed_behavior"})
SET gdb.name = "Goal-Directed Behavior",
    gdb.turkishName = "Hedefe yönelik davranış",
    gdb.description = "Belirli bir hedefe ulaşmaya yönelik olarak ortaya çıkan davranış örüntüsüdür.",
    gdb.ontologySource = "BCIO / Human Behaviour Ontology",
    gdb.ontologyId = "BCIO:050818",
    gdb.sourceUri = "https://www.bciosearch.org/BCIO_050818",
    gdb.ontologyMappingType = "EXACT_MATCH";

MERGE (study:Behavior:BehaviorExample {nodeId: "behaviorexample_studying_regularly_for_exam"})
SET study.name = "Studying Regularly for an Exam",
    study.turkishName = "Sınava düzenli çalışma",
    study.description = "Kısa vadeli dikkat dağıtıcılara rağmen bir sınavda başarılı olma hedefi doğrultusunda düzenli çalışma davranışıdır.";

MERGE (notifications:Behavior:BehaviorExample {nodeId: "behaviorexample_checking_smartphone_notifications"})
SET notifications.name = "Checking Smartphone Notifications",
    notifications.turkishName = "Akıllı telefon bildirimlerini kontrol etme",
    notifications.description = "Ödül beklentisi veya yeni bilgiye ulaşma isteğiyle akıllı telefon bildirimlerini kontrol etme davranışıdır.";

MERGE (sugaryFood:Behavior:BehaviorExample {nodeId: "behaviorexample_seeking_sugary_food"})
SET sugaryFood.name = "Seeking Sugary Food",
    sugaryFood.turkishName = "Şekerli yiyecek arama",
    sugaryFood.description = "Tatlı veya şekerli yiyecek elde etme hedefiyle ortaya çıkan ödül beklentisi ilişkili davranıştır.";



// RELATIONSHIPS

MATCH (vta:BrainRegion {nodeId: "brainregion_vta"})
MATCH (dopamine:Neurochemical {nodeId: "neurochemical_dopamine"})
MERGE (vta)-[r_releases:RELEASES]->(dopamine)
SET r_releases.relationshipId = "rel_vta_releases_dopamine",
    r_releases.description = "VTA, Reward / Motivation MVP'sinde dopamine için temel kaynak beyin bölgesi olarak temsil edilmiştir.",
    r_releases.sourceKey = "salamone2012mysterious",
    r_releases.doi = "10.1016/j.neuron.2012.10.021",
    r_releases.sourceUri = "https://doi.org/10.1016/j.neuron.2012.10.021",
    r_releases.evidenceNote = "Mesolimbic dopamine sistemi ve dopamine'in motivation-related süreçlerdeki rolü için kullanılmıştır.";

MATCH (dopamine:Neurochemical {nodeId: "neurochemical_dopamine"})
MATCH (nac:BrainRegion {nodeId: "brainregion_nucleus_accumbens"})
MERGE (dopamine)-[r_modulates:MODULATES]->(nac)
SET r_modulates.relationshipId = "rel_dopamine_modulates_nucleus_accumbens",
    r_modulates.description = "Dopamine, nucleus accumbens üzerindeki reward ve motivation ilişkili modülatör etkiyi temsil etmektedir.",
    r_modulates.sourceKey = "salamone2012mysterious",
    r_modulates.doi = "10.1016/j.neuron.2012.10.021",
    r_modulates.sourceUri = "https://doi.org/10.1016/j.neuron.2012.10.021",
    r_modulates.evidenceNote = "Nucleus accumbens dopamine'in motivation, effort ve behavioral activation ile ilişkisi için kullanılmıştır.";

MATCH (nac:BrainRegion {nodeId: "brainregion_nucleus_accumbens"})
MATCH (reward:CognitiveProcess {nodeId: "cognitiveprocess_reward_processing"})
MERGE (nac)-[r_involved:INVOLVED_IN]->(reward)
SET r_involved.relationshipId = "rel_nucleus_accumbens_involved_in_reward_processing",
    r_involved.description = "Nucleus accumbens, reward processing sürecinde rol alan beyin bölgesi olarak temsil edilmiştir.",
    r_involved.sourceKey = "berridge2015pleasure",
    r_involved.doi = "10.1016/j.neuron.2015.02.018",
    r_involved.sourceUri = "https://doi.org/10.1016/j.neuron.2015.02.018",
    r_involved.evidenceNote = "Reward ve pleasure sistemlerinde nucleus accumbens'in rolünü desteklemek için kullanılmıştır.";

MATCH (reward:CognitiveProcess {nodeId: "cognitiveprocess_reward_processing"})
MATCH (motivation:CognitiveProcess {nodeId: "cognitiveprocess_motivation"})
MERGE (reward)-[r_regulates:REGULATES]->(motivation)
SET r_regulates.relationshipId = "rel_reward_processing_regulates_motivation",
    r_regulates.description = "Reward processing, reward learning ve incentive salience bileşenleri üzerinden motivation sürecini düzenleyen bilişsel süreç olarak temsil edilmiştir.",
    r_regulates.sourceKey = "berridge1998dopamine",
    r_regulates.doi = "10.1016/S0165-0173(98)00019-8",
    r_regulates.sourceUri = "https://doi.org/10.1016/S0165-0173(98)00019-8",
    r_regulates.evidenceNote = "Dopamine, reward learning ve incentive salience ayrımı üzerinden reward-motivation bağlantısını desteklemek için kullanılmıştır.";

MATCH (motivation:CognitiveProcess {nodeId: "cognitiveprocess_motivation"})
MATCH (gdb:BehaviorPattern {nodeId: "behaviorpattern_goal_directed_behavior"})
MERGE (motivation)-[r_contributes:CONTRIBUTES_TO]->(gdb)
SET r_contributes.relationshipId = "rel_motivation_contributes_to_goal_directed_behavior",
    r_contributes.description = "Motivation, goal-directed behavior örüntüsünün ortaya çıkmasına ve sürdürülmesine katkı sağlayan süreç olarak temsil edilmiştir.",
    r_contributes.sourceKey = "salamone2012mysterious",
    r_contributes.doi = "10.1016/j.neuron.2012.10.021",
    r_contributes.sourceUri = "https://doi.org/10.1016/j.neuron.2012.10.021",
    r_contributes.evidenceNote = "Mesolimbic dopamine'in motivation, effort ve behavioral activation işlevleri üzerinden motivation-behavior bağlantısını desteklemek için kullanılmıştır.";

MATCH (gdb:BehaviorPattern {nodeId: "behaviorpattern_goal_directed_behavior"})
MATCH (study:BehaviorExample {nodeId: "behaviorexample_studying_regularly_for_exam"})
MERGE (gdb)-[r_example_study:HAS_EXAMPLE]->(study)
SET r_example_study.relationshipId = "rel_goal_directed_behavior_has_example_studying_exam",
    r_example_study.description = "Düzenli sınav çalışması, belirli bir hedefe ulaşmaya yönelik davranış örneği olarak modellenmiştir.";

MATCH (gdb:BehaviorPattern {nodeId: "behaviorpattern_goal_directed_behavior"})
MATCH (notifications:BehaviorExample {nodeId: "behaviorexample_checking_smartphone_notifications"})
MERGE (gdb)-[r_example_notifications:HAS_EXAMPLE]->(notifications)
SET r_example_notifications.relationshipId = "rel_goal_directed_behavior_has_example_checking_notifications",
    r_example_notifications.description = "Akıllı telefon bildirimlerini kontrol etme davranışı, ödül beklentisiyle ilişkili hedefe yönelik davranış örneği olarak modellenmiştir.";

MATCH (gdb:BehaviorPattern {nodeId: "behaviorpattern_goal_directed_behavior"})
MATCH (sugaryFood:BehaviorExample {nodeId: "behaviorexample_seeking_sugary_food"})
MERGE (gdb)-[r_example_sugary_food:HAS_EXAMPLE]->(sugaryFood)
SET r_example_sugary_food.relationshipId = "rel_goal_directed_behavior_has_example_seeking_sugary_food",
    r_example_sugary_food.description = "Şekerli yiyecek arama davranışı, ödül beklentisi ve hedefe yönelik davranış örneği olarak modellenmiştir.";


// GÖRSELLEŞTİRME SORGUSU

MATCH mainPath =
(:BrainRegion {nodeId: "brainregion_vta"})
-[:RELEASES]->(:Neurochemical {nodeId: "neurochemical_dopamine"})
-[:MODULATES]->(:BrainRegion {nodeId: "brainregion_nucleus_accumbens"})
-[:INVOLVED_IN]->(:CognitiveProcess {nodeId: "cognitiveprocess_reward_processing"})
-[:REGULATES]->(:CognitiveProcess {nodeId: "cognitiveprocess_motivation"})
-[:CONTRIBUTES_TO]->(:BehaviorPattern {nodeId: "behaviorpattern_goal_directed_behavior"})

MATCH examplePath =
(:BehaviorPattern {nodeId: "behaviorpattern_goal_directed_behavior"})
-[:HAS_EXAMPLE]->(:BehaviorExample)

RETURN mainPath, examplePath;