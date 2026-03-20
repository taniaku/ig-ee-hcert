Profile: EEHealthCertificateOccupational
Parent: EEHealthCertificate
Id: ee-health-certificate-occupational
Title: "Töötervishoiu tervisekontrolli otsus"
Description: "Töötervishoiu tervisekontrolli otsuse baasprofiil"
* ^experimental = false
* category = CertificateCategoryCS#occupational
* event.period ^short = "Töötervishoiu tervisekontrolli otsuse kehtivus"
* section contains riskFactors 0..1 and employer 0..1 and additionalConditions 0..1 and employerSuggestions 0..1 and employeeSuggestions 0..1
* section[riskFactors] ^short = "Töölaadi ja töökeskkonnaga seotud ohutegurid"
* section[riskFactors].code = $HC_SECTION#risk-factors
* section[riskFactors].entry 1..*
* section[riskFactors].entry only Reference(EEHealthCertificateWorkRelatedRiskFactor)
* section[riskFactors].entry ^short = "Viide contained Observation ressursile ohuteguriga"
* section[riskFactors].text 0..1
* section[riskFactors].text ^short = "Üldine kommentaar"
* section[riskFactors].text.status = #additional
* section[riskFactors].modifierExtension ..0

* section[employer] 1..1
* section[employer] ^short = "Töötamine"
* section[employer].code = $HC_SECTION#employer
* section[employer].entry 1..1
* section[employer].entry only Reference(EEHealthCertificateOccupationalEmployment)
* section[employer].entry ^short = "Viide contained Observation ressursile töösuhega"
* section[employer].text 1..1
* section[employer].text ^short = "Tööandja asutuse registri number"
* section[employer].text.status = #additional
* section[employer].modifierExtension ..0

* section[additionalConditions] ^short = "Töötamiseks vajalik lisatingimus"
* section[additionalConditions].code = $HC_SECTION#work-additional-restrictions
* section[additionalConditions].entry 1..*
* section[additionalConditions].entry only Reference(EEHealthCertificateWorkAdditionalCondition)
* section[additionalConditions].entry ^short = "Viide contained Observation ressursile lisatingimusega"
* section[additionalConditions].text 0..1
* section[additionalConditions].text ^short = "Üldine kommentaar"
* section[additionalConditions].text.status = #additional
* section[additionalConditions].modifierExtension ..0

* section[employerSuggestions] ^short = "Ettepanekud tööandjale"
* section[employerSuggestions].code = $HC_SECTION#employer-suggestions
* section[employerSuggestions].text 1..1
* section[employerSuggestions].text ^short = "Vabatekst"
* section[employerSuggestions].text.status = #additional
* section[employerSuggestions].modifierExtension ..0
* section[employerSuggestions].entry ..0

* section[employeeSuggestions] ^short = "Ettepanekud töötajale"
* section[employeeSuggestions].code = $HC_SECTION#employee-suggestions
* section[employeeSuggestions].text 1..1
* section[employeeSuggestions].text ^short = "Vabatekst"
* section[employeeSuggestions].text.status = #additional
* section[employeeSuggestions].modifierExtension ..0
* section[employeeSuggestions].entry ..0

* contained contains riskFactor 0..* and employment 1..1 and additionalCondition 0..*

* contained[medicalRestriction] ^short = "Meditsiinilised piirangud"
* contained[medicalRestriction].component.code from OccupationalMedicalRestrictionVS (required)

* contained[riskFactor] only EEHealthCertificateWorkRelatedRiskFactor
* contained[riskFactor] ^short = "Töölaadi ja töökeskkonnaga seotud ohutegurid"

* contained[employment] only EEHealthCertificateOccupationalEmployment
* contained[employment] ^short = "Töötamine"

* contained[additionalCondition] only EEHealthCertificateWorkAdditionalCondition
* contained[additionalCondition] ^short = "Töötamiseks vajalik lisatingimus"

* contained[decision] ^short = "Otsus"
* contained[decision].value[x] from OccupationalDecisionVS (required)

* obeys ee-hcert-occupational-period-required

Invariant: ee-hcert-occupational-period-required
Description: "Töötervishoiu tervisekontrolli otsuse kehtivusaeg on kohustuslik, kui tegemist on positiivse otsusega."
Severity: #error
Expression: "contained.where($this.ofType(Observation)).where(code.coding.where(system='http://snomed.info/sct' and code='419183001').exists()).value.ofType(CodeableConcept).coding.where(system='http://snomed.info/sct' and (code='160926000' or code='225891002')).exists() implies event.period.exists()"

Profile: EEHealthCertificateOccupationalEmployer
Parent: EEHealthCertificateOccupational
Id: ee-health-certificate-occupational-employer
Title: "Töötervishoiu tervisekontrolli otsus tööandjale"
Description: "Töötervishoiu tervisekontrolli otsuse profiil tööandjale kuvamiseks"
* ^experimental = true
* subject.identifier 1..1
* subject.identifier ^short = "Patsiendi Eesti isikukoodi identifikaator"
* subject.identifier.use 0..0
* subject.identifier.system = "https://fhir.ee/sid/pid/est/ni"
* subject.identifier.value ^short = "Patsiendi Eesti isikukoodi väärtus"
* section[employeeSuggestions] ..0
