ValueSet: TervisetoendiStaatusFHIR
Id: tervisetoendi-staatus-fhir--1.0.0
Title: "Tervisetõendi staatus (FHIR)"
Description: "Tervisetõendi teenuses kasutatavad staatused. Kasutatakse ainult FHIR teenuses."
* ^language = #et
* ^extension[0].url = "http://hl7.org/fhir/tools/StructureDefinition/web-source"
* ^extension[=].valueUrl = "https://akk.tehik.ee/classifier/fhir/ValueSet/tervisetoendi-staatus-fhir"
* ^extension[+].url = "https://fhir.ee/StructureDefinition/version-description"
* ^extension[=].valueString = "Korrigeeritud eestikeelseid nimetusi ning lisatud juurde uus väärtus"
// problem related https://smjira.sm.ee/browse/UPTIS-5317
//* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/valueset-supplement"
//* ^extension[=].valueCanonical = "https://fhir.ee/CodeSystem/composition-staatus|1.0.0"
* ^url = "https://fhir.ee/ValueSet/tervisetoendi-staatus-fhir"
* ^version = "1.0.0"
* ^versionAlgorithmString = "semver"
* ^status = #active
* ^experimental = false
* ^date = "2026-03-13T12:30:53.817303Z"
* ^publisher = "TEHIK"
* ^contact.name = "TEHIK andmekorraldus"
* ^contact.telecom[0].system = #url
* ^contact.telecom[=].value = "https://tehik.ee"
* ^contact.telecom[+].system = #email
* ^contact.telecom[=].value = "andmekorraldus@tehik.ee"
* ^effectivePeriod.start = "2026-02-16T00:00:00Z"
* ^author.name = "TEHIK"
* ^compose.inactive = false
* ^expansion.total = 4
* ^expansion.contains[0].system = "http://hl7.org/fhir/composition-status"
* ^expansion.contains[=].code = #preliminary
* ^expansion.contains[=].display = "Mustand"
* ^expansion.contains[+].system = "http://hl7.org/fhir/composition-status"
* ^expansion.contains[=].code = #entered-in-error
* ^expansion.contains[=].display = "Tühistatud"
* ^expansion.contains[+].system = "http://hl7.org/fhir/composition-status"
* ^expansion.contains[=].code = #final
* ^expansion.contains[=].display = "Lõpetatud"
* ^expansion.contains[+].system = "http://hl7.org/fhir/composition-status"
* ^expansion.contains[=].code = #cancelled
* ^expansion.contains[=].display = "Peatatud"
* CompositionStatus#cancelled "Peatatud"
* CompositionStatus#cancelled ^designation.language = #en
* CompositionStatus#cancelled ^designation.value = "cancelled"
* CompositionStatus#final "Lõpetatud"
* CompositionStatus#final ^designation.language = #en
* CompositionStatus#final ^designation.value = "final"
* CompositionStatus#preliminary "Mustand"
* CompositionStatus#preliminary ^designation.language = #en
* CompositionStatus#preliminary ^designation.value = "preliminary"
* CompositionStatus#entered-in-error "Tühistatud"
* CompositionStatus#entered-in-error ^designation.language = #en
* CompositionStatus#entered-in-error ^designation.value = "entered-in-error"
