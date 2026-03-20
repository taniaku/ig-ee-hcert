Instance: EmploymentExample
InstanceOf: EEHealthCertificateOccupationalEmployment
Title: "Patsiendi töötamine"
Usage: #inline
* id = "600"
* status = #final
* code = $SCT#184104002 "Patient occupation"
* performer.display = "Suurepärane OÜ"
* performer.identifier.system = "https://fhir.ee/sid/org/est/br"
* performer.identifier.value = "12345678"
* component[job].valueCodeableConcept = OccupationCS#22122501 "Pediaater"
* component[rate].valueQuantity = 0.75 '1'

Instance: DecisionExample
InstanceOf: EEHealthCertificateDecision
Usage: #inline
* id = "700"
* status = #final
* code = $SCT#419183001 "Practitioner decision status"
* valueCodeableConcept = $SCT#160910001 //"Ei sobi töötama"

Instance: MedicalRestrictionExample1
InstanceOf: EEHealthCertificateMedicalRestriction
Usage: #inline
* id = "800"
* status = #final
* code = $SCT#146861000181105 "Restriction"
* component.code = RestrictionsCS#586 // Vältida käsitsi raskuste teisaldamist üle
* component.valueQuantity = 10 'kg'
* note.text = "Raskemad asjad tõsta ainult abivahenditega"

Instance: MedicalRestrictionExample2
InstanceOf: EEHealthCertificateMedicalRestriction
Usage: #inline
* id = "802"
* status = #final
* code = $SCT#146861000181105 "Restriction"
* component.code = RestrictionsCS#750 // Ei sobi töö järgmiste töökeskkonna ohuteguritega
* component.valueCodeableConcept = WorkRelatedRiskFactorsCS#114 "Kantserogeenid"

Instance: RiskFactorExample
InstanceOf: EEHealthCertificateWorkRelatedRiskFactor
Usage: #inline
* id = "900"
* status = #final
* code = $SCT#80943009 "Risk factor"
* valueCodeableConcept = WorkRelatedRiskFactorsCS#558 "Raskuste käsitsi teisaldamine"

Instance: AdditionalConditionExample
InstanceOf: EEHealthCertificateWorkAdditionalCondition
Usage: #inline
* id = "1000"
* status = #final
* code = $SCT#225891002 "Fit for work with certain limitations"
* valueCodeableConcept = WorkAdditionalConditionCS#personal-protective-equipment

RuleSet: OccupationalHealthCertificateBase
* identifier[0]
  * system = "https://fhir.ee/hcert/health-certificate-number"
  * value = "DOC-12345"
* status = StatusCS#preliminary
* type.coding = $SCT#772786005 "Medical certificate (record artifact)"
* subject = Reference(PatientExample)
* date = "2024-11-05T11:45:29.0437162+00:00"
* author = Reference(PractitionerRoleExample)
* title = "Töötervishoiu tervisekontrolli otsus"
* event.period.start = "2024-05-05T00:00:00.000+00:00"
* event.period.end = "2025-11-05T00:00:00.000+00:00"
* contained[author] = PractitionerRoleExample
* contained[employment] = EmploymentExample
* contained[+] = DecisionExample
* contained[+] = MedicalRestrictionExample1
* contained[+] = MedicalRestrictionExample2
* contained[riskFactor] = RiskFactorExample
* contained[additionalCondition] = AdditionalConditionExample
* section[employer]
  * entry = Reference(EmploymentExample)
  * text.status = #additional
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">10006966</div>"
* section[decision]
  * entry = Reference(DecisionExample)
* section[medicalRestriction]
  * entry[+] = Reference(MedicalRestrictionExample1)
  * entry[+] = Reference(MedicalRestrictionExample2)
  * text.status = #additional
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Tekst, mis kirjeldab piirangud</div>"
* section[shortenedReason]
  * text.status = #additional
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Arst ei usalda isiku uuringute tulemustele</div>"
* section[rejectReason]
  * text.status = #additional
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Raske füüsiline töö, ei sobi selja probleemide tõttu</div>"
* section[changeReason]
  * text.status = #additional
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Kirjavea parandus</div>"
* section[cancelReason]
  * text.status = #additional
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Vale otsus</div>"
* section[suspendReason]
  * text.status = #additional
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Ootab lisauringute tulemusi</div>"
* section[riskFactors]
  * entry = Reference(RiskFactorExample)
  * text.status = #additional
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Tekst, mis kirjeldab ohutegurid</div>"
* section[healthDeclaration]
  * entry.identifier.value = "HD-67890"
  * entry.identifier.system = "https://fhir.ee/hcert/health-declaration-external-document-number"
* section[additionalConditions]
  * entry = Reference(AdditionalConditionExample)
  * text.status = #additional
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Tekst, mis kirjeldab lisatingumusi</div>"
* section[employerSuggestions]
  * text.status = #additional
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Töötajale on vaja parem valgustus</div>"

Instance: OccupationalHealthCertExample
InstanceOf: EEHealthCertificateOccupational
Title: "Töötervishoiu tervisekontrolli otsus"
Description: "Mustand olekus töötervishoiu tervisekontrolli otsus, osaliselt täidetud ressursi näidis"
Usage: #example
* id = "1100"
* insert OccupationalHealthCertificateBase
* section[employeeSuggestions]
  * text.status = #additional
  * text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Tööandja peab paigaldama uut valgustust</div>"

Instance: OccupationalEmployerHealthCertExample
InstanceOf: EEHealthCertificateOccupationalEmployer
Title: "Töötervishoiu tervisekontrolli otsus tööandjale"
Description: "Mustand olekus töötervishoiu tervisekontrolli otsus tööandjale, osaliselt täidetud ressursi näidis"
Usage: #example
* id = "1110"
* insert OccupationalHealthCertificateBase
* subject.identifier.system = "https://fhir.ee/sid/pid/est/ni"
* subject.identifier.value = "37605030299"
