// 08 - SOSYAL BAĞLANMA MVP'si

// NODES

MERGE (hypothalamus:BrainRegion {nodeId: "brainregion_hypothalamus"})
SET hypothalamus.name = "Hypothalamus",
hypothalamus.turkishName = "Hipotalamus",
hypothalamus.description = "Oksitosin sistemi, nöroendokrin düzenleme ve sosyal davranışla ilişkili beyin bölgesidir.",
hypothalamus.ontologySource = "Uberon",
hypothalamus.ontologyId = "UBERON:0001898",
hypothalamus.sourceUri = "http://purl.obolibrary.org/obo/UBERON_0001898",
hypothalamus.ontologyMappingType = "EXACT_MATCH";

MERGE (oxytocin:Neurochemical {nodeId: "neurochemical_oxytocin"})
SET oxytocin.name = "Oxytocin",
oxytocin.turkishName = "Oksitosin",
oxytocin.description = "Sosyal bağlanma, sosyal biliş ve nöroendokrin düzenleme süreçleriyle ilişkili nöropeptittir.",
oxytocin.ontologySource = "ChEBI",
oxytocin.ontologyId = "CHEBI:7872",
oxytocin.sourceUri = "https://www.ebi.ac.uk/chebi/CHEBI:7872",
oxytocin.ontologyMappingType = "EXACT_MATCH";

MERGE (nacc:BrainRegion {nodeId: "brainregion_nucleus_accumbens"})
SET nacc.name = "Nucleus Accumbens",
nacc.turkishName = "Nucleus accumbens",
nacc.description = "Ödül, pekiştirme ve sosyal ödül öğrenimiyle ilişkili ventral striatal beyin bölgesidir.",
nacc.ontologySource = "Uberon",
nacc.ontologyId = "UBERON:0001882",
nacc.sourceUri = "http://purl.obolibrary.org/obo/UBERON_0001882",
nacc.ontologyMappingType = "EXACT_MATCH";

MERGE (attachmentFormation:CognitiveProcess {nodeId: "cognitiveprocess_psychological_attachment_formation"})
SET attachmentFormation.name = "Psychological Attachment Formation",
attachmentFormation.turkishName = "Psikolojik bağlanma oluşumu",
attachmentFormation.description = "Bir psikolojik bağın oluşması veya güçlenmesiyle ilişkili bilişsel ve duygusal süreçtir.",
attachmentFormation.ontologySource = "BCIO",
attachmentFormation.ontologyId = "BCIO:050748",
attachmentFormation.sourceUri = "https://www.bciosearch.org/BCIO_050748",
attachmentFormation.ontologyMappingType = "CLOSE_MATCH";

MERGE (pairBonding:BehaviorPattern {nodeId: "behaviorpattern_pair_bonding_social_attachment"})
SET pairBonding.name = "Pair Bonding and Social Attachment",
pairBonding.turkishName = "Çift bağı ve sosyal bağlanma",
pairBonding.description = "Belirli bir sosyal partnere veya kişiye yönelik seçici ve süreklilik taşıyan sosyal bağlanma örüntüsüdür.",
pairBonding.ontologySource = "Literature-based local concept",
pairBonding.ontologyId = "local:pair_bonding_social_attachment",
pairBonding.sourceUri = "https://doi.org/10.1038/nn1327",
pairBonding.ontologyMappingType = "LITERATURE_BASED_LOCAL_CONCEPT";

MERGE (proximityExample:BehaviorExample {nodeId: "behaviorexample_maintaining_proximity"})
SET proximityExample.name = "Maintaining Proximity to Partner",
proximityExample.turkishName = "Partnere yakınlığı sürdürme",
proximityExample.description = "Bireyin sosyal bağ kurduğu partnere yakın kalma eğilimini temsil eden davranış örneğidir.";

MERGE (preferenceExample:BehaviorExample {nodeId: "behaviorexample_partner_preference"})
SET preferenceExample.name = "Partner Preference",
preferenceExample.turkishName = "Partner tercihi",
preferenceExample.description = "Tanıdık veya bağ kurulmuş partnerle yabancı bireye kıyasla daha fazla sosyal temas kurma eğilimini temsil eden davranış örneğidir.";

MERGE (contactExample:BehaviorExample {nodeId: "behaviorexample_selective_affiliative_contact"})
SET contactExample.name = "Selective Affiliative Contact",
contactExample.turkishName = "Seçici yakın sosyal temas",
contactExample.description = "Belirli bir sosyal partnere yönelik seçici yakınlık, temas ve birlikte vakit geçirme davranışını temsil eden örnektir.";



// RELATIONSHIPS

MATCH (hypothalamus:BrainRegion {nodeId: "brainregion_hypothalamus"})
MATCH (oxytocin:Neurochemical {nodeId: "neurochemical_oxytocin"})
MERGE (hypothalamus)-[r_releases_oxytocin:RELEASES]->(oxytocin)
SET r_releases_oxytocin.relationshipId = "rel_hypothalamus_releases_oxytocin_social_attachment",
r_releases_oxytocin.description = "Hipotalamus, Sosyal Bağlanma MVP'sinde oksitosin için kaynak beyin bölgesi olarak temsil edilmiştir.",
r_releases_oxytocin.sourceKey = "lee2009oxytocin",
r_releases_oxytocin.doi = "10.1016/j.pneurobio.2009.04.001",
r_releases_oxytocin.sourceUri = "https://doi.org/10.1016/j.pneurobio.2009.04.001",
r_releases_oxytocin.evidenceNote = "Oksitosinin merkezi sinir sistemi ve nöroendokrin işlevleriyle ilişkisini desteklemek için kullanılmıştır.";

MATCH (oxytocin:Neurochemical {nodeId: "neurochemical_oxytocin"})
MATCH (nacc:BrainRegion {nodeId: "brainregion_nucleus_accumbens"})
MERGE (oxytocin)-[r_modulates_nacc:MODULATES]->(nacc)
SET r_modulates_nacc.relationshipId = "rel_oxytocin_modulates_nucleus_accumbens_social_attachment",
r_modulates_nacc.description = "Oksitosin, nucleus accumbens ile ilişkili sosyal ödül ve bağlanma süreçlerini düzenleyici nörokimyasal öğe olarak temsil edilmiştir.",
r_modulates_nacc.sourceKey = "loth2021oxytocin",
r_modulates_nacc.doi = "10.1210/endocr/bqaa223",
r_modulates_nacc.sourceUri = "https://doi.org/10.1210/endocr/bqaa223",
r_modulates_nacc.evidenceNote = "Oksitosin, dopamin ve ödül sistemi etkileşiminin çift bağı bağlamındaki rolünü desteklemek için kullanılmıştır.";

MATCH (nacc:BrainRegion {nodeId: "brainregion_nucleus_accumbens"})
MATCH (attachmentFormation:CognitiveProcess {nodeId: "cognitiveprocess_psychological_attachment_formation"})
MERGE (nacc)-[r_involved_attachment:INVOLVED_IN]->(attachmentFormation)
SET r_involved_attachment.relationshipId = "rel_nucleus_accumbens_involved_in_attachment_formation",
r_involved_attachment.description = "Nucleus accumbens, sosyal ödül ve pekiştirme süreçleri üzerinden psikolojik bağlanma oluşumunda rol alan beyin bölgesi olarak temsil edilmiştir.",
r_involved_attachment.sourceKey = "young2004pairbonding",
r_involved_attachment.doi = "10.1038/nn1327",
r_involved_attachment.sourceUri = "https://doi.org/10.1038/nn1327",
r_involved_attachment.evidenceNote = "Partner tercihi oluşumunda mezolimbik dopamin ve ödül merkezlerinin rolünü desteklemek için kullanılmıştır.";

MATCH (attachmentFormation:CognitiveProcess {nodeId: "cognitiveprocess_psychological_attachment_formation"})
MATCH (pairBonding:BehaviorPattern {nodeId: "behaviorpattern_pair_bonding_social_attachment"})
MERGE (attachmentFormation)-[r_contributes_bonding:CONTRIBUTES_TO]->(pairBonding)
SET r_contributes_bonding.relationshipId = "rel_attachment_formation_contributes_to_pair_bonding",
r_contributes_bonding.description = "Psikolojik bağlanma oluşumu, çift bağı ve sosyal bağlanma örüntüsüne katkı sağlayan süreç olarak temsil edilmiştir.",
r_contributes_bonding.sourceKey = "insel2001neurobiology",
r_contributes_bonding.doi = "10.1038/35053579",
r_contributes_bonding.sourceUri = "https://doi.org/10.1038/35053579",
r_contributes_bonding.evidenceNote = "Bağlanmanın moleküler, hücresel ve sistem düzeylerinde ele alınmasını desteklemek için kullanılmıştır.";

MATCH (pairBonding:BehaviorPattern {nodeId: "behaviorpattern_pair_bonding_social_attachment"})
MATCH (proximityExample:BehaviorExample {nodeId: "behaviorexample_maintaining_proximity"})
MERGE (pairBonding)-[r_example_proximity:HAS_EXAMPLE]->(proximityExample)
SET r_example_proximity.relationshipId = "rel_pair_bonding_has_example_maintaining_proximity",
r_example_proximity.description = "Partnere yakınlığı sürdürme davranışı, çift bağı ve sosyal bağlanma örneği olarak modellenmiştir.";

MATCH (pairBonding:BehaviorPattern {nodeId: "behaviorpattern_pair_bonding_social_attachment"})
MATCH (preferenceExample:BehaviorExample {nodeId: "behaviorexample_partner_preference"})
MERGE (pairBonding)-[r_example_preference:HAS_EXAMPLE]->(preferenceExample)
SET r_example_preference.relationshipId = "rel_pair_bonding_has_example_partner_preference",
r_example_preference.description = "Partner tercihi davranışı, çift bağı ve sosyal bağlanma örneği olarak modellenmiştir.";

MATCH (pairBonding:BehaviorPattern {nodeId: "behaviorpattern_pair_bonding_social_attachment"})
MATCH (contactExample:BehaviorExample {nodeId: "behaviorexample_selective_affiliative_contact"})
MERGE (pairBonding)-[r_example_contact:HAS_EXAMPLE]->(contactExample)
SET r_example_contact.relationshipId = "rel_pair_bonding_has_example_selective_affiliative_contact",
r_example_contact.description = "Seçici yakın sosyal temas davranışı, çift bağı ve sosyal bağlanma örneği olarak modellenmiştir.";




// GORSELLESTIRME SORGUSU

MATCH mainPath =
(:BrainRegion {nodeId: "brainregion_hypothalamus"})
-[:RELEASES]->(:Neurochemical {nodeId: "neurochemical_oxytocin"})
-[:MODULATES]->(:BrainRegion {nodeId: "brainregion_nucleus_accumbens"})
-[:INVOLVED_IN]->(:CognitiveProcess {nodeId: "cognitiveprocess_psychological_attachment_formation"})
-[:CONTRIBUTES_TO]->(:BehaviorPattern {nodeId: "behaviorpattern_pair_bonding_social_attachment"})

MATCH examplePath =
(:BehaviorPattern {nodeId: "behaviorpattern_pair_bonding_social_attachment"})
-[:HAS_EXAMPLE]->(:BehaviorExample)

RETURN mainPath, examplePath;