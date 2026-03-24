
Profile: EEHealthCertificate
Parent: Composition
Id: ee-health-certificate
Title: "Tervisetõend"
Description: "Tervisetõendi baasprofiil"
* ^experimental = false
* ^abstract = true
* url ..0
* modifierExtension ..0
* implicitRules ..0
* identifier 1..1
* identifier.use ..0
* identifier ^short = "Dokumendi number"
* identifier.system 1..1
* identifier.system = "https://fhir.ee/hcert/health-certificate-number"
* identifier.value 1..1
* status ^short = "Tõendi staatus"
* status from StatusVS (required)
* type ^short = "Composition ressursi tüüp. Fikseeritud väärtus"
* type.coding = $SCT#772786005 "Medical certificate (record artifact)"
* category 1..1
* category ^short = "Tervisekontrolli kasutusala"
* category from CertificateCategoryVS (required)
* subject only Reference(Patient)
* subject ^type.targetProfile = MpiPatientVerified
* subject 1..1
* subject ^short = "MPI Patient reference"
* encounter ..0
* date ^short = "Dokumendi väljastamise aeg"
* date 1..1
* useContext ..0
* author 1..1
* author only Reference(PractitionerRole)
* author ^short = "Viide contained PractitionerRole ressursile"
* name ..0
* title ^short = "Tõendi nimetus. Sama mis category"
* note ..0
* attester ..0
* custodian ..0
* relatesTo ..0
* event 0..1
* event.modifierExtension 0..0
* event.period 0..1
* event.period ^short = "Tervisetõendi kehtivus"
* event.period.start 1..1
* event.period.start ^short = "Alguskuupäev"
* event.period.end 1..1
* event.period.end ^short = "Lõppkuupäev"
* event.detail 0..0

// sections
* section ^slicing.discriminator.type = #value
* section ^slicing.discriminator.path = #code
* section ^slicing.rules = #open
* section contains decision 0..1 and healthDeclaration 1..1 and medicalRestriction 0..1 and shortenedReason 0..1 and rejectReason 0..1 and changeReason 0..1 and cancelReason 0..1 and suspendReason 0..1
* section[decision] ^short = "Otsus"
* section[decision].code = $HC_SECTION#decision
* section[decision].entry 1..1
* section[decision].entry only Reference(EEHealthCertificateDecision)
* section[decision].entry ^short = "Viide contained Observation ressursile otsuse koodiga"
* section[decision].modifierExtension ..0

* section[healthDeclaration] ^short = "Tervisedeklaratsioon"
* section[healthDeclaration].code = $HC_SECTION#health-declaration
* section[healthDeclaration].entry 1..1
* section[healthDeclaration].modifierExtension ..0
* section[healthDeclaration].entry only Reference(QuestionnaireResponse)
* section[healthDeclaration].entry ^short = "Viide tervisedelaratsioonile"
* section[healthDeclaration].entry.reference ^short = "Kanooniline viide tervisedeklaratsioonile (HDECL QuestionnaireResponse ressursile)"
* section[healthDeclaration].entry.identifier ..1
* section[healthDeclaration].entry.identifier ^short = "Tervisedeklaratsiooni dokumendi number kui HDECL QuestionnaireResponse ressursile ei saa viidata"
* section[healthDeclaration].entry.identifier.use 0..0
* section[healthDeclaration].entry.identifier.system = "https://fhir.ee/hcert/health-declaration-external-document-number"
* section[healthDeclaration].entry.identifier.system 1..1
* section[healthDeclaration].entry.identifier.value ^short = "Tervisedeklaratsiooni dokumendi number välises infosüsteemis"
* section[healthDeclaration].entry.identifier.value 1..1
* section[healthDeclaration].entry.display 0..1
* section[healthDeclaration].entry.display ^short = "Read-only väli, määratakse ainult andmete migreerimisel. Tervisedeklaratsiooni viide tekstiga, kui deklaratsioon on tehtud paberil"

* section[medicalRestriction] ^short = "Meditsiinilised piirangud"
* section[medicalRestriction].code = $HC_SECTION#medical-restrictions
* section[medicalRestriction].entry 0..*
* section[medicalRestriction].entry only Reference(EEHealthCertificateMedicalRestriction)
* section[medicalRestriction].entry ^short = "Viide contained Observation ressursile (Meditsiiniline piirang)"
* section[medicalRestriction].text 0..1
* section[medicalRestriction].text ^short = "Üldine kommentaar"
* section[medicalRestriction].text.status = #additional
* section[medicalRestriction].modifierExtension ..0

* section[shortenedReason] ^short = "Lühema tervisekontrolli aja põhjus"
* section[shortenedReason].code = $HC_SECTION#shortened-reason
* section[shortenedReason].text 1..1
* section[shortenedReason].text ^short = "Vabatekst lühema tervisekontrolli aja põhjusega"
* section[shortenedReason].text.status = #additional
* section[shortenedReason].modifierExtension ..0
* section[shortenedReason].entry ..0

* section[rejectReason] ^short = "Eitava otsuse põhjendus"
* section[rejectReason].code = $HC_SECTION#reject-reason
* section[rejectReason].text 1..1
* section[rejectReason].text ^short = "Vabatekst eitava otsuse põhjendusega"
* section[rejectReason].text.status = #additional
* section[rejectReason].modifierExtension ..0
* section[rejectReason].entry ..0

* section[changeReason] ^short = "Tervisetõendi muutmise põhjus"
* section[changeReason].code = $HC_SECTION#change-reason
* section[changeReason].text 1..1
* section[changeReason].text ^short = "Vabatekst tervisetõendi muutmise põhjusega"
* section[changeReason].text.status = #additional
* section[changeReason].modifierExtension ..0
* section[changeReason].entry ..0

* section[cancelReason] ^short = "Tervisetõendi tühistamise põhjus. Read-only sektsioon, põhjus määratakse operatsiooniga."
* section[cancelReason].code = $HC_SECTION#cancel-reason
* section[cancelReason].text 1..1
* section[cancelReason].text ^short = "Vabatekst tervisetõendi tühistamise põhjusega"
* section[cancelReason].text.status = #additional
* section[cancelReason].modifierExtension ..0
* section[cancelReason].entry ..0

* section[suspendReason] ^short = "Tervisetõendi peatamise põhjus. Read-only sektsioon, põhjus määratakse operatsiooniga."
* section[suspendReason].code = $HC_SECTION#suspend-reason
* section[suspendReason].text 1..1
* section[suspendReason].text ^short = "Vabatekst tervisetõendi peatamise põhjusega"
* section[suspendReason].text.status = #additional
* section[suspendReason].modifierExtension ..0
* section[suspendReason].entry ..0

// contained resources
* contained ^slicing.discriminator[0].type = #type
* contained ^slicing.discriminator[0].path = "$this"
* contained ^slicing.discriminator[1].type = #profile
* contained ^slicing.discriminator[1].path = "$this"
* contained ^slicing.ordered = false
* contained ^slicing.rules = #open
* contained contains decision 0..1 and medicalRestriction 0..* and author 1..1

* contained[author] only PractitionerRole
* contained[author] ^short = "Tervisetõendi autor"
* contained[author].practitioner 1..1
* contained[author].practitioner ^short = "Viide SPD Practitioner ressursile"
* contained[author].organization 1..1
* contained[author].organization ^short = "Viide SPD Organization ressursile"
* contained[author].implicitRules ..0
* contained[author].modifierExtension ..0
* contained[author].contained ..0

* contained[decision] only EEHealthCertificateDecision
* contained[decision] ^short = "Otsus"

* contained[medicalRestriction] only EEHealthCertificateMedicalRestriction
* contained[medicalRestriction] ^short = "Meditsiinilised piirangud"
