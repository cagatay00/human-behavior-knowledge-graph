// 02 - ÇABA VE MOTİVASYON MVP'si

// NODES

MERGE (vta:BrainRegion {nodeId: "brainregion_vta"})
SET vta.name = "Ventral Tegmental Area",
vta.turkishName = "Ventral tegmental alan",
vta.description = "Motivasyon ve çaba ile ilişkili dopaminerjik sinyal üretimi açısından önemli bir kaynak beyin bölgesidir.",
vta.ontologySource = "Uberon",
vta.ontologyId = "UBERON:0002691",
vta.sourceUri = "http://purl.obolibrary.org/obo/UBERON_0002691",
vta.ontologyMappingType = "EXACT_MATCH";

MERGE (dopamine:Neurochemical {nodeId: "neurochemical_dopamine"})
SET dopamine.name = "Dopamine",
dopamine.turkishName = "Dopamin",
dopamine.description = "Motivasyon, çaba gösterme ve hedef beyin bölgelerinin modülasyonu ile ilişkili katekolamin türü bir nörokimyasal maddedir.",
dopamine.ontologySource = "ChEBI",
dopamine.ontologyId = "CHEBI:18243",
dopamine.sourceUri = "http://purl.obolibrary.org/obo/CHEBI_18243",
dopamine.ontologyMappingType = "EXACT_MATCH";

MERGE (nac:BrainRegion {nodeId: "brainregion_nucleus_accumbens"})
SET nac.name = "Nucleus Accumbens",
nac.turkishName = "Nucleus accumbens",
nac.description = "Çaba ile ilişkili motivasyonel süreçlerde ve davranışsal etkinleşmede rol alan ventral striatum bölgesindeki bir beyin yapısıdır.",
nac.ontologySource = "Uberon",
nac.ontologyId = "UBERON:0001882",
nac.sourceUri = "http://purl.obolibrary.org/obo/UBERON_0001882",
nac.ontologyMappingType = "EXACT_MATCH";

MERGE (effortDecision:CognitiveProcess {nodeId: "cognitiveprocess_effort_based_decision_making"})
SET effortDecision.name = "Effort-Based Decision Making",
effortDecision.turkishName = "Çaba temelli karar verme",
effortDecision.description = "Hedef değeri ile hedefe ulaşmak için gereken çaba maliyeti arasındaki değerlendirme sürecidir.",
effortDecision.ontologySource = "Literature-based local concept",
effortDecision.ontologyId = "local:effort_based_decision_making",
effortDecision.sourceUri = "local:effort_based_decision_making",
effortDecision.ontologyMappingType = "LITERATURE_BASED";

MERGE (motivation:CognitiveProcess {nodeId: "cognitiveprocess_motivation"})
SET motivation.name = "Motivation",
motivation.turkishName = "Motivasyon",
motivation.description = "Davranışı hedeflere doğru enerjilendiren, yönlendiren ve sürdürülmesine katkı sağlayan bilişsel ve motivasyonel süreçtir.",
motivation.ontologySource = "BCIO / Human Behaviour Ontology",
motivation.ontologyId = "BCIO:006133",
motivation.sourceUri = "https://www.bciosearch.org/BCIO_006133",
motivation.ontologyMappingType = "CLOSE_MATCH";

MERGE (effortBehavior:Behavior:BehaviorPattern {nodeId: "behaviorpattern_effortful_goal_directed_behavior"})
SET effortBehavior.name = "Effortful Goal-Directed Behavior",
effortBehavior.turkishName = "Çaba gerektiren hedefe yönelik davranış",
effortBehavior.description = "Belirli bir hedefe ulaşmak için çaba göstermeyi ve davranışı sürdürmeyi içeren davranış örüntüsüdür.",
effortBehavior.ontologySource = "BCIO / Human Behaviour Ontology",
effortBehavior.ontologyId = "BCIO:050818",
effortBehavior.sourceUri = "https://www.bciosearch.org/BCIO_050818",
effortBehavior.ontologyMappingType = "CLOSE_MATCH";

MERGE (studyEffort:Behavior:BehaviorExample {nodeId: "behaviorexample_studying_for_exam_despite_effort"})
SET studyEffort.name = "Studying for an Exam Despite Effort",
studyEffort.turkishName = "Çaba gerektirmesine rağmen sınava çalışma",
studyEffort.description = "Bireyin yüksek çaba gerektirmesine rağmen sınav başarısı hedefi doğrultusunda çalışmaya devam etme davranışıdır.";

MERGE (exerciseGoal:Behavior:BehaviorExample {nodeId: "behaviorexample_exercising_to_reach_fitness_goal"})
SET exerciseGoal.name = "Exercising to Reach a Fitness Goal",
exerciseGoal.turkishName = "Fitness hedefine ulaşmak için egzersiz yapma",
exerciseGoal.description = "Bireyin fiziksel çaba gerektirmesine rağmen uzun vadeli fitness hedefi doğrultusunda egzersiz yapma davranışıdır.";

MERGE (projectWork:Behavior:BehaviorExample {nodeId: "behaviorexample_working_on_difficult_project"})
SET projectWork.name = "Working on a Difficult Project",
projectWork.turkishName = "Zor bir projeyi tamamlamak için çalışma",
projectWork.description = "Bireyin zorlayıcı ve zaman alan bir projeyi tamamlamak için çaba göstermesini temsil eden davranış örneğidir.";


// RELATIONSHIPS

MATCH (vta:BrainRegion {nodeId: "brainregion_vta"})
MATCH (dopamine:Neurochemical {nodeId: "neurochemical_dopamine"})
MERGE (vta)-[r_releases:RELEASES]->(dopamine)
SET r_releases.relationshipId = "rel_vta_releases_dopamine_effort",
r_releases.description = "VTA, Effort vs Motivation MVP'sinde dopamine için temel kaynak beyin bölgesi olarak temsil edilmiştir.",
r_releases.sourceKey = "salamone2012mysterious",
r_releases.doi = "10.1016/j.neuron.2012.10.021",
r_releases.sourceUri = "https://doi.org/10.1016/j.neuron.2012.10.021",
r_releases.evidenceNote = "Mesolimbic dopamine sistemi ve dopamine'in motivation-related süreçlerdeki rolü için kullanılmıştır.";

MATCH (dopamine:Neurochemical {nodeId: "neurochemical_dopamine"})
MATCH (nac:BrainRegion {nodeId: "brainregion_nucleus_accumbens"})
MERGE (dopamine)-[r_modulates:MODULATES]->(nac)
SET r_modulates.relationshipId = "rel_dopamine_modulates_nucleus_accumbens_effort",
r_modulates.description = "Dopamine, nucleus accumbens üzerindeki effort-related motivation ilişkili modülatör etkiyi temsil etmektedir.",
r_modulates.sourceKey = "salamone2007effort",
r_modulates.doi = "10.1007/s00213-006-0668-9",
r_modulates.sourceUri = "https://doi.org/10.1007/s00213-006-0668-9",
r_modulates.evidenceNote = "Nucleus accumbens dopamine'in effort-related motivation ve behavioral activation ile ilişkisi için kullanılmıştır.";

MATCH (nac:BrainRegion {nodeId: "brainregion_nucleus_accumbens"})
MATCH (effortDecision:CognitiveProcess {nodeId: "cognitiveprocess_effort_based_decision_making"})
MERGE (nac)-[r_involved:INVOLVED_IN]->(effortDecision)
SET r_involved.relationshipId = "rel_nucleus_accumbens_involved_in_effort_based_decision_making",
r_involved.description = "Nucleus accumbens, effort-based decision making sürecinde rol alan beyin bölgesi olarak temsil edilmiştir.",
r_involved.sourceKey = "salamone2007effort",
r_involved.doi = "10.1007/s00213-006-0668-9",
r_involved.sourceUri = "https://doi.org/10.1007/s00213-006-0668-9",
r_involved.evidenceNote = "Nucleus accumbens dopamine ve çaba temelli davranış süreçleri arasındaki ilişkiyi desteklemek için kullanılmıştır.";

MATCH (effortDecision:CognitiveProcess {nodeId: "cognitiveprocess_effort_based_decision_making"})
MATCH (motivation:CognitiveProcess {nodeId: "cognitiveprocess_motivation"})
MERGE (effortDecision)-[r_regulates:REGULATES]->(motivation)
SET r_regulates.relationshipId = "rel_effort_based_decision_making_regulates_motivation",
r_regulates.description = "Effort-based decision making, çaba maliyeti ve hedef değeri değerlendirmesi üzerinden motivation sürecini düzenleyen bilişsel süreç olarak temsil edilmiştir.",
r_regulates.sourceKey = "kurniawan2011dopamine",
r_regulates.doi = "10.3389/fnins.2011.00081",
r_regulates.sourceUri = "https://doi.org/10.3389/fnins.2011.00081",
r_regulates.evidenceNote = "Dopamine ve effort-based decision making ilişkisi üzerinden effort-motivation bağlantısını desteklemek için kullanılmıştır.";

MATCH (motivation:CognitiveProcess {nodeId: "cognitiveprocess_motivation"})
MATCH (effortBehavior:BehaviorPattern {nodeId: "behaviorpattern_effortful_goal_directed_behavior"})
MERGE (motivation)-[r_contributes:CONTRIBUTES_TO]->(effortBehavior)
SET r_contributes.relationshipId = "rel_motivation_contributes_to_effortful_goal_directed_behavior",
r_contributes.description = "Motivation, effortful goal-directed behavior örüntüsünün ortaya çıkmasına ve sürdürülmesine katkı sağlayan süreç olarak temsil edilmiştir.",
r_contributes.sourceKey = "salamone2016activational",
r_contributes.doi = "10.1093/brain/aww050",
r_contributes.sourceUri = "https://doi.org/10.1093/brain/aww050",
r_contributes.evidenceNote = "Motivasyonun aktivasyonel ve çaba ile ilişkili yönleri üzerinden motivation-behavior bağlantısını desteklemek için kullanılmıştır.";

MATCH (effortBehavior:BehaviorPattern {nodeId: "behaviorpattern_effortful_goal_directed_behavior"})
MATCH (studyEffort:BehaviorExample {nodeId: "behaviorexample_studying_for_exam_despite_effort"})
MERGE (effortBehavior)-[r_example_study:HAS_EXAMPLE]->(studyEffort)
SET r_example_study.relationshipId = "rel_effortful_goal_directed_behavior_has_example_studying_exam",
r_example_study.description = "Sınav başarısı için çalışmaya devam etme davranışı, çaba gerektiren hedefe yönelik davranış örneği olarak modellenmiştir.";

MATCH (effortBehavior:BehaviorPattern {nodeId: "behaviorpattern_effortful_goal_directed_behavior"})
MATCH (exerciseGoal:BehaviorExample {nodeId: "behaviorexample_exercising_to_reach_fitness_goal"})
MERGE (effortBehavior)-[r_example_exercise:HAS_EXAMPLE]->(exerciseGoal)
SET r_example_exercise.relationshipId = "rel_effortful_goal_directed_behavior_has_example_exercising_goal",
r_example_exercise.description = "Fitness hedefi için egzersiz yapma davranışı, çaba gerektiren hedefe yönelik davranış örneği olarak modellenmiştir.";

MATCH (effortBehavior:BehaviorPattern {nodeId: "behaviorpattern_effortful_goal_directed_behavior"})
MATCH (projectWork:BehaviorExample {nodeId: "behaviorexample_working_on_difficult_project"})
MERGE (effortBehavior)-[r_example_project:HAS_EXAMPLE]->(projectWork)
SET r_example_project.relationshipId = "rel_effortful_goal_directed_behavior_has_example_project_work",
r_example_project.description = "Zor bir projeyi tamamlamak için çalışma davranışı, çaba gerektiren hedefe yönelik davranış örneği olarak modellenmiştir.";


// GÖRSELLEŞTİRME SORGUSU

MATCH mainPath =
(:BrainRegion {nodeId: "brainregion_vta"})
-[:RELEASES]->(:Neurochemical {nodeId: "neurochemical_dopamine"})
-[:MODULATES]->(:BrainRegion {nodeId: "brainregion_nucleus_accumbens"})
-[:INVOLVED_IN]->(:CognitiveProcess {nodeId: "cognitiveprocess_effort_based_decision_making"})
-[:REGULATES]->(:CognitiveProcess {nodeId: "cognitiveprocess_motivation"})
-[:CONTRIBUTES_TO]->(:BehaviorPattern {nodeId: "behaviorpattern_effortful_goal_directed_behavior"})

MATCH examplePath =
(:BehaviorPattern {nodeId: "behaviorpattern_effortful_goal_directed_behavior"})
-[:HAS_EXAMPLE]->(:BehaviorExample)

RETURN mainPath, examplePath;