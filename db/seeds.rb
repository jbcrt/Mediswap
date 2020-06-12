require 'faker'

pwd = "password"

Offer.destroy_all
Profile.destroy_all
Facility.destroy_all
User.destroy_all

puts "🗑  Tout a été nettoyé !"
puts ""
puts "👨‍⚕️‍ Création d'un kiné et de ses annonces ..."

kine = User.new(
    email:  "kine@mediswap.com",
    password: pwd,
)
kine.skip_confirmation!
kine.save!

puts "👤  Création du profil du kiné ..."

kine_profile = Profile.new(
    title: "mister",
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    profession: "Masseur-Kinésithérapeute",
    professional_id_number: rand(10 ** 11).to_s
)

kine_profile.user = kine
kine_profile.save!

puts "🏥  Création de l'établissement du kiné ..."

kine_facility = Facility.new(
    name: Faker::Company.name,
    category: FACILITY_CATEGORIES.sample,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    street: "Avenue du Général de Gaulle",
    department: "Charente-Maritime",
    zipcode: "17000",
    city: "La Rochelle"
)

kine_facility.user = kine
kine_facility.save!

puts "📃  Création de l'offre de remplacement du kiné ..."

kine_replacement = Replacement.new(
    profession: kine_profile.profession,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    contract_type: "Remplacement libéral occasionnel",
    street: kine_facility.street,
    department: kine_facility.department,
    zipcode: kine_facility.zipcode,
    city: kine_facility.city,
    working_time: Offer.working_times.keys.sample,
    starts_at: Faker::Date.between(from: Date.today, to: 1.month.from_now),
    ends_at: Faker::Date.between(from: 1.month.from_now, to: 2.month.from_now),
    retrocession: rand(70...100).to_s,
    daily_medical_acts_number: rand(10...30).to_s,
    on_call: Faker::Boolean.boolean,
    vehicle_required: Faker::Boolean.boolean,
    visit: Offer.visits.keys.sample,
    secretariat: Offer.secretariats.keys.sample,
    housing_possibility: Faker::Boolean.boolean,
    offer_type: Offer.offer_types.keys.sample
)

kine_replacement.user = kine
kine_replacement.save!

puts "📃  Création de l'offre d'emploi du kiné ..."

kine_employment = Employment.new(
    profession: kine_profile.profession,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    contract_type: Employment.contract_types.keys.sample,
    street: kine_facility.street,
    department: kine_facility.department,
    zipcode: kine_facility.zipcode,
    city: kine_facility.city,
    working_time: Offer.working_times.keys.sample,
    has_salary_set: false,
    candidate_job_experience: Employment.candidate_job_experiences.keys.sample,
    candidate_description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    offer_type: Offer.offer_types.keys.sample
)

kine_employment.user = kine
kine_employment.save!

puts "📃  Création de l'offre de collaboration du kiné ..."

kine_collaboration = Collaboration.new(
    profession: kine_profile.profession,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    contract_type: Collaboration.contract_types.keys.sample,
    street: kine_facility.street,
    department: kine_facility.department,
    zipcode: kine_facility.zipcode,
    city: kine_facility.city,
    retrocession: rand(70...100).to_s,
    daily_medical_acts_number: rand(10...30).to_s,
    on_call: Faker::Boolean.boolean,
    vehicle_required: Faker::Boolean.boolean,
    visit: Offer.visits.keys.sample,
    secretariat: Offer.secretariats.keys.sample,
    housing_possibility: Faker::Boolean.boolean,
    offer_type: Offer.offer_types.keys.sample
)

kine_collaboration.user = kine
kine_collaboration.save!

puts "📃  Création de l'offre de cession de patientèle du kiné ..."

kine_patient_transfer = PatientTransfer.new(
    profession: kine_profile.profession,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    contract_type: PatientTransfer.contract_types.keys.sample,
    street: kine_facility.street,
    department: kine_facility.department,
    zipcode: kine_facility.zipcode,
    city: kine_facility.city,
    has_selling_price_set: false,
    revenues: rand(100000...200000).to_s,
    premises_size: rand(40...80).to_s,
    premises_rooms_number: rand(2...4).to_s,
    premises_availability: "Location",
    premises_rent: rand(450...850).to_s,
    premises_furnished: true,
    premises_equipment: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false),
    premises_has_parking: Faker::Boolean.boolean,
    accessible_premises: Faker::Boolean.boolean,
    offer_type: Offer.offer_types.keys.sample
)

kine_patient_transfer.user = kine
kine_patient_transfer.save!

puts "📃  Création de l'offre d'installation du kiné ..."

kine_establishment = Establishment.new(
    profession: kine_profile.profession,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    contract_type: "Cession de local",
    street: "Rue de la Guignette",
    department: kine_facility.department,
    zipcode: kine_facility.zipcode,
    city: kine_facility.city,
    premises_price: rand(100000...200000).to_s,
    premises_size: rand(40...80).to_s,
    premises_rooms_number: rand(2...4).to_s,
    premises_rent: rand(450...850).to_s,
    premises_furnished: false,
    premises_has_parking: Faker::Boolean.boolean,
    accessible_premises: Faker::Boolean.boolean,
    offer_type: Offer.offer_types.keys.sample
)

kine_establishment.user = kine
kine_establishment.save!

kine.save!

puts "👍  Création du kiné et de ses annonces"
puts ""
puts "👨‍⚕️‍ Création d'un médecin gé et de ses annonces ..."

medecin_ge = User.new(
    email:  "medecin_ge@mediswap.com",
    password: pwd,
)
medecin_ge.skip_confirmation!
medecin_ge.save!

puts "👤  Création du profil du médecin gé ..."

medecin_ge_profile = Profile.new(
    title: "mister",
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    profession: "Médecin Généraliste",
    professional_id_number: rand(10 ** 11).to_s
)

medecin_ge_profile.user = medecin_ge
medecin_ge_profile.save!

puts "🏥  Création de l'établissement du médecin gé ..."

medecin_ge_facility = Facility.new(
    name: Faker::Company.name,
    category: FACILITY_CATEGORIES.sample,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    street: "Allée des Demoiselles",
    department: "Haute-Garonne",
    zipcode: "31400",
    city: "Toulouse"
)

medecin_ge_facility.user = medecin_ge
medecin_ge_facility.save!

puts "📃  Création de l'offre de remplacement du médecin gé ..."

medecin_ge_replacement = Replacement.new(
    profession: medecin_ge_profile.profession,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    contract_type: "Remplacement libéral occasionnel",
    street: medecin_ge_facility.street,
    department: medecin_ge_facility.department,
    zipcode: medecin_ge_facility.zipcode,
    city: medecin_ge_facility.city,
    working_time: Offer.working_times.keys.sample,
    starts_at: Faker::Date.between(from: Date.today, to: 1.month.from_now),
    ends_at: Faker::Date.between(from: 1.month.from_now, to: 2.month.from_now),
    retrocession: rand(70...100).to_s,
    daily_medical_acts_number: rand(10...30).to_s,
    on_call: Faker::Boolean.boolean,
    vehicle_required: Faker::Boolean.boolean,
    visit: Offer.visits.keys.sample,
    secretariat: Offer.secretariats.keys.sample,
    housing_possibility: Faker::Boolean.boolean,
    offer_type: Offer.offer_types.keys.sample
)

medecin_ge_replacement.user = medecin_ge
medecin_ge_replacement.save!

puts "📃  Création de l'offre d'emploi du médecin gé ..."

medecin_ge_employment = Employment.new(
    profession: medecin_ge_profile.profession,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    contract_type: Employment.contract_types.keys.sample,
    street: medecin_ge_facility.street,
    department: medecin_ge_facility.department,
    zipcode: medecin_ge_facility.zipcode,
    city: medecin_ge_facility.city,
    working_time: Offer.working_times.keys.sample,
    has_salary_set: false,
    candidate_job_experience: Employment.candidate_job_experiences.keys.sample,
    candidate_description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    offer_type: Offer.offer_types.keys.sample
)

medecin_ge_employment.user = medecin_ge
medecin_ge_employment.save!

puts "📃  Création de l'offre de collaboration du médecin gé ..."

medecin_ge_collaboration = Collaboration.new(
    profession: medecin_ge_profile.profession,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    contract_type: Collaboration.contract_types.keys.sample,
    street: medecin_ge_facility.street,
    department: medecin_ge_facility.department,
    zipcode: medecin_ge_facility.zipcode,
    city: medecin_ge_facility.city,
    retrocession: rand(70...100).to_s,
    daily_medical_acts_number: rand(10...30).to_s,
    on_call: Faker::Boolean.boolean,
    vehicle_required: Faker::Boolean.boolean,
    visit: Offer.visits.keys.sample,
    secretariat: Offer.secretariats.keys.sample,
    housing_possibility: Faker::Boolean.boolean,
    offer_type: Offer.offer_types.keys.sample
)

medecin_ge_collaboration.user = medecin_ge
medecin_ge_collaboration.save!

puts "📃  Création de l'offre de cession de patientèle du médecin gé ..."

medecin_ge_patient_transfer = PatientTransfer.new(
    profession: medecin_ge_profile.profession,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    contract_type: PatientTransfer.contract_types.keys.sample,
    street: medecin_ge_facility.street,
    department: medecin_ge_facility.department,
    zipcode: medecin_ge_facility.zipcode,
    city: medecin_ge_facility.city,
    has_selling_price_set: false,
    revenues: rand(100000...200000).to_s,
    premises_size: rand(40...80).to_s,
    premises_rooms_number: rand(2...4).to_s,
    premises_availability: "Location",
    premises_rent: rand(450...850).to_s,
    premises_furnished: true,
    premises_equipment: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false),
    premises_has_parking: Faker::Boolean.boolean,
    accessible_premises: Faker::Boolean.boolean,
    offer_type: Offer.offer_types.keys.sample
)

medecin_ge_patient_transfer.user = medecin_ge
medecin_ge_patient_transfer.save!

puts "📃  Création de l'offre d'installation du médecin gé ..."

medecin_ge_establishment = Establishment.new(
    profession: medecin_ge_profile.profession,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    contract_type: "Cession de local",
    street: "Rue du Général Giraud",
    department: medecin_ge_facility.department,
    zipcode: medecin_ge_facility.zipcode,
    city: medecin_ge_facility.city,
    premises_price: rand(100000...200000).to_s,
    premises_size: rand(40...80).to_s,
    premises_rooms_number: rand(2...4).to_s,
    premises_rent: rand(450...850).to_s,
    premises_furnished: false,
    premises_has_parking: Faker::Boolean.boolean,
    accessible_premises: Faker::Boolean.boolean,
    offer_type: Offer.offer_types.keys.sample
)

medecin_ge_establishment.user = medecin_ge
medecin_ge_establishment.save!

medecin_ge.save!

puts "👍  Création du psychologue et de ses annonces"
puts ""
puts "👨‍⚕️‍ Création d'un psychologue et de ses annonces ..."

psychologue = User.new(
    email:  "psychologue@mediswap.com",
    password: pwd,
)
psychologue.skip_confirmation!
psychologue.save!

puts "👤  Création du profil du psychologue ..."

psychologue_profile = Profile.new(
    title: "mister",
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    profession: "Psychologue",
    professional_id_number: rand(10 ** 11).to_s
)

psychologue_profile.user = psychologue
psychologue_profile.save!

puts "🏥  Création de l'établissement du psychologue ..."

psychologue_facility = Facility.new(
    name: Faker::Company.name,
    category: FACILITY_CATEGORIES.sample,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    street: "Rue Oberlin",
    department: "Bas-Rhin",
    zipcode: "67000",
    city: "Strasbourg"
)

psychologue_facility.user = psychologue
psychologue_facility.save!

puts "📃  Création de l'offre de remplacement du psychologue ..."

psychologue_replacement = Replacement.new(
    profession: psychologue_profile.profession,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    contract_type: "Remplacement libéral occasionnel",
    street: psychologue_facility.street,
    department: psychologue_facility.department,
    zipcode: psychologue_facility.zipcode,
    city: psychologue_facility.city,
    working_time: Offer.working_times.keys.sample,
    starts_at: Faker::Date.between(from: Date.today, to: 1.month.from_now),
    ends_at: Faker::Date.between(from: 1.month.from_now, to: 2.month.from_now),
    retrocession: rand(70...100).to_s,
    daily_medical_acts_number: rand(10...30).to_s,
    on_call: Faker::Boolean.boolean,
    vehicle_required: Faker::Boolean.boolean,
    visit: Offer.visits.keys.sample,
    secretariat: Offer.secretariats.keys.sample,
    housing_possibility: Faker::Boolean.boolean,
    offer_type: Offer.offer_types.keys.sample
)

psychologue_replacement.user = psychologue
psychologue_replacement.save!

puts "📃  Création de l'offre d'emploi du psychologue ..."

psychologue_employment = Employment.new(
    profession: psychologue_profile.profession,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    contract_type: Employment.contract_types.keys.sample,
    street: psychologue_facility.street,
    department: psychologue_facility.department,
    zipcode: psychologue_facility.zipcode,
    city: psychologue_facility.city,
    working_time: Offer.working_times.keys.sample,
    has_salary_set: false,
    candidate_job_experience: Employment.candidate_job_experiences.keys.sample,
    candidate_description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    offer_type: Offer.offer_types.keys.sample
)

psychologue_employment.user = psychologue
psychologue_employment.save!

puts "📃  Création de l'offre de collaboration du psychologue ..."

psychologue_collaboration = Collaboration.new(
    profession: psychologue_profile.profession,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    contract_type: Collaboration.contract_types.keys.sample,
    street: psychologue_facility.street,
    department: psychologue_facility.department,
    zipcode: psychologue_facility.zipcode,
    city: psychologue_facility.city,
    retrocession: rand(70...100).to_s,
    daily_medical_acts_number: rand(10...30).to_s,
    on_call: Faker::Boolean.boolean,
    vehicle_required: Faker::Boolean.boolean,
    visit: Offer.visits.keys.sample,
    secretariat: Offer.secretariats.keys.sample,
    housing_possibility: Faker::Boolean.boolean,
    offer_type: Offer.offer_types.keys.sample
)

psychologue_collaboration.user = psychologue
psychologue_collaboration.save!

puts "📃  Création de l'offre de cession de patientèle du psychologue ..."

psychologue_patient_transfer = PatientTransfer.new(
    profession: psychologue_profile.profession,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    contract_type: PatientTransfer.contract_types.keys.sample,
    street: psychologue_facility.street,
    department: psychologue_facility.department,
    zipcode: psychologue_facility.zipcode,
    city: psychologue_facility.city,
    has_selling_price_set: false,
    revenues: rand(100000...200000).to_s,
    premises_size: rand(40...80).to_s,
    premises_rooms_number: rand(2...4).to_s,
    premises_availability: "Location",
    premises_rent: rand(450...850).to_s,
    premises_furnished: true,
    premises_equipment: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false),
    premises_has_parking: Faker::Boolean.boolean,
    accessible_premises: Faker::Boolean.boolean,
    offer_type: Offer.offer_types.keys.sample
)

psychologue_patient_transfer.user = psychologue
psychologue_patient_transfer.save!

puts "📃  Création de l'offre d'installation du psychologue ..."

psychologue_establishment = Establishment.new(
    profession: psychologue_profile.profession,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    contract_type: "Cession de local",
    street: "Quai Mullenheim",
    department: psychologue_facility.department,
    zipcode: psychologue_facility.zipcode,
    city: psychologue_facility.city,
    premises_price: rand(100000...200000).to_s,
    premises_size: rand(40...80).to_s,
    premises_rooms_number: rand(2...4).to_s,
    premises_rent: rand(450...850).to_s,
    premises_furnished: false,
    premises_has_parking: Faker::Boolean.boolean,
    accessible_premises: Faker::Boolean.boolean,
    offer_type: Offer.offer_types.keys.sample
)

psychologue_establishment.user = psychologue
psychologue_establishment.save!

psychologue.save!

puts "👍  Création du psychologue et de ses annonces"
puts ""
puts "👩‍⚕️‍ Création d'une infirmière et de ses annonces ..."

infirmiere = User.new(
    email:  "infirmiere@mediswap.com",
    password: pwd,
)
infirmiere.skip_confirmation!
infirmiere.save!

puts "👤  Création du profil de l'infirmière ..."

infirmiere_profile = Profile.new(
    title: "madam",
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    profession: "Infirmier",
    professional_id_number: rand(10 ** 11).to_s
)

infirmiere_profile.user = infirmiere
infirmiere_profile.save!

puts "🏥  Création de l'établissement de l'infirmière ..."

infirmiere_facility = Facility.new(
    name: Faker::Company.name,
    category: FACILITY_CATEGORIES.sample,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    street: "Avenue du Docteur Schinazi",
    department: "Gironde",
    zipcode: "33300",
    city: "Bordeaux"
)

infirmiere_facility.user = infirmiere
infirmiere_facility.save!

puts "📃  Création de l'offre de remplacement de l'infirmière ..."

infirmiere_replacement = Replacement.new(
    profession: infirmiere_profile.profession,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    contract_type: "Remplacement libéral régulier",
    street: infirmiere_facility.street,
    department: infirmiere_facility.department,
    zipcode: infirmiere_facility.zipcode,
    city: infirmiere_facility.city,
    working_time: Offer.working_times.keys.sample,
    starts_at: Faker::Date.between(from: Date.today, to: 1.month.from_now),
    retrocession: rand(70...100).to_s,
    daily_medical_acts_number: rand(10...30).to_s,
    on_call: Faker::Boolean.boolean,
    vehicle_required: Faker::Boolean.boolean,
    visit: Offer.visits.keys.sample,
    secretariat: Offer.secretariats.keys.sample,
    housing_possibility: Faker::Boolean.boolean,
    offer_type: Offer.offer_types.keys.sample
)

infirmiere_replacement.user = infirmiere
infirmiere_replacement.save!

puts "📃  Création de l'offre d'emploi de l'infirmière ..."

infirmiere_employment = Employment.new(
    profession: infirmiere_profile.profession,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    contract_type: Employment.contract_types.keys.sample,
    street: infirmiere_facility.street,
    department: infirmiere_facility.department,
    zipcode: infirmiere_facility.zipcode,
    city: infirmiere_facility.city,
    working_time: Offer.working_times.keys.sample,
    has_salary_set: false,
    candidate_job_experience: Employment.candidate_job_experiences.keys.sample,
    candidate_description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    offer_type: Offer.offer_types.keys.sample
)

infirmiere_employment.user = infirmiere
infirmiere_employment.save!

puts "📃  Création de l'offre de collaboration de l'infirmière ..."

infirmiere_collaboration = Collaboration.new(
    profession: infirmiere_profile.profession,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    contract_type: Collaboration.contract_types.keys.sample,
    street: infirmiere_facility.street,
    department: infirmiere_facility.department,
    zipcode: infirmiere_facility.zipcode,
    city: infirmiere_facility.city,
    retrocession: rand(70...100).to_s,
    daily_medical_acts_number: rand(10...30).to_s,
    on_call: Faker::Boolean.boolean,
    vehicle_required: Faker::Boolean.boolean,
    visit: Offer.visits.keys.sample,
    secretariat: Offer.secretariats.keys.sample,
    housing_possibility: Faker::Boolean.boolean,
    offer_type: Offer.offer_types.keys.sample
)

infirmiere_collaboration.user = infirmiere
infirmiere_collaboration.save!

puts "📃  Création de l'offre de cession de patientèle de l'infirmière ..."

infirmiere_patient_transfer = PatientTransfer.new(
    profession: infirmiere_profile.profession,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    contract_type: PatientTransfer.contract_types.keys.sample,
    street: infirmiere_facility.street,
    department: infirmiere_facility.department,
    zipcode: infirmiere_facility.zipcode,
    city: infirmiere_facility.city,
    has_selling_price_set: false,
    revenues: rand(100000...200000).to_s,
    premises_size: rand(40...80).to_s,
    premises_rooms_number: rand(2...4).to_s,
    premises_availability: "Location",
    premises_rent: rand(450...850).to_s,
    premises_furnished: true,
    premises_equipment: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false),
    premises_has_parking: Faker::Boolean.boolean,
    accessible_premises: Faker::Boolean.boolean,
    offer_type: Offer.offer_types.keys.sample
)

infirmiere_patient_transfer.user = infirmiere
infirmiere_patient_transfer.save!

puts "📃  Création de l'offre d'installation de l'infirmière ..."

infirmiere_establishment = Establishment.new(
    profession: infirmiere_profile.profession,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    contract_type: "Cession de local",
    street: "Rue Camille Godard",
    department: infirmiere_facility.department,
    zipcode: infirmiere_facility.zipcode,
    city: infirmiere_facility.city,
    premises_price: rand(100000...200000).to_s,
    premises_size: rand(40...80).to_s,
    premises_rooms_number: rand(2...4).to_s,
    premises_rent: rand(450...850).to_s,
    premises_furnished: false,
    premises_has_parking: Faker::Boolean.boolean,
    accessible_premises: Faker::Boolean.boolean,
    offer_type: Offer.offer_types.keys.sample
)

infirmiere_establishment.user = infirmiere
infirmiere_establishment.save!

infirmiere.save!

puts "👍  Création de l'infirmière et de ses annonces"
puts ""
puts "👩‍⚕️‍ Création d'une dentiste et de ses annonces ..."

dentiste = User.new(
    email:  "dentiste@mediswap.com",
    password: pwd,
)
dentiste.skip_confirmation!
dentiste.save!

puts "👤  Création du profil de la dentiste ..."

dentiste_profile = Profile.new(
    title: "madam",
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    profession: "Chirurgien Dentiste",
    professional_id_number: rand(10 ** 11).to_s
)

dentiste_profile.user = dentiste
dentiste_profile.save!

puts "🏥  Création de l'établissement de la dentiste ..."

dentiste_facility = Facility.new(
    name: Faker::Company.name,
    category: FACILITY_CATEGORIES.sample,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    street: "Rue d'Anjou",
    department: "Paris",
    zipcode: "75008",
    city: "Paris"
)

dentiste_facility.user = dentiste
dentiste_facility.save!

puts "📃  Création de l'offre de remplacement de la dentiste ..."

dentiste_replacement = Replacement.new(
    profession: dentiste_profile.profession,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    contract_type: "Remplacement libéral occasionnel",
    street: dentiste_facility.street,
    department: dentiste_facility.department,
    zipcode: dentiste_facility.zipcode,
    city: dentiste_facility.city,
    working_time: Offer.working_times.keys.sample,
    starts_at: Faker::Date.between(from: Date.today, to: 1.month.from_now),
    ends_at: Faker::Date.between(from: 1.month.from_now, to: 2.month.from_now),
    retrocession: rand(70...100).to_s,
    daily_medical_acts_number: rand(10...30).to_s,
    on_call: Faker::Boolean.boolean,
    vehicle_required: Faker::Boolean.boolean,
    visit: Offer.visits.keys.sample,
    secretariat: Offer.secretariats.keys.sample,
    housing_possibility: Faker::Boolean.boolean,
    offer_type: Offer.offer_types.keys.sample
)

dentiste_replacement.user = dentiste
dentiste_replacement.save!

puts "📃  Création de l'offre d'emploi de la dentiste ..."

dentiste_employment = Employment.new(
    profession: dentiste_profile.profession,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    contract_type: Employment.contract_types.keys.sample,
    street: dentiste_facility.street,
    department: dentiste_facility.department,
    zipcode: dentiste_facility.zipcode,
    city: dentiste_facility.city,
    working_time: Offer.working_times.keys.sample,
    has_salary_set: false,
    candidate_job_experience: Employment.candidate_job_experiences.keys.sample,
    candidate_description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    offer_type: Offer.offer_types.keys.sample
)

dentiste_employment.user = dentiste
dentiste_employment.save!

puts "📃  Création de l'offre de collaboration de la dentiste ..."

dentiste_collaboration = Collaboration.new(
    profession: dentiste_profile.profession,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    contract_type: Collaboration.contract_types.keys.sample,
    street: dentiste_facility.street,
    department: dentiste_facility.department,
    zipcode: dentiste_facility.zipcode,
    city: dentiste_facility.city,
    retrocession: rand(70...100).to_s,
    daily_medical_acts_number: rand(10...30).to_s,
    on_call: Faker::Boolean.boolean,
    vehicle_required: Faker::Boolean.boolean,
    visit: Offer.visits.keys.sample,
    secretariat: Offer.secretariats.keys.sample,
    housing_possibility: Faker::Boolean.boolean,
    offer_type: Offer.offer_types.keys.sample
)

dentiste_collaboration.user = dentiste
dentiste_collaboration.save!

puts "📃  Création de l'offre de cession de patientèle de la dentiste ..."

dentiste_patient_transfer = PatientTransfer.new(
    profession: dentiste_profile.profession,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    contract_type: PatientTransfer.contract_types.keys.sample,
    street: dentiste_facility.street,
    department: dentiste_facility.department,
    zipcode: dentiste_facility.zipcode,
    city: dentiste_facility.city,
    has_selling_price_set: false,
    revenues: rand(100000...200000).to_s,
    premises_size: rand(40...80).to_s,
    premises_rooms_number: rand(2...4).to_s,
    premises_availability: "Location",
    premises_rent: rand(450...850).to_s,
    premises_furnished: true,
    premises_equipment: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false),
    premises_has_parking: Faker::Boolean.boolean,
    accessible_premises: Faker::Boolean.boolean,
    offer_type: Offer.offer_types.keys.sample
)

dentiste_patient_transfer.user = dentiste
dentiste_patient_transfer.save!

puts "📃  Création de l'offre d'installation de la dentiste ..."

dentiste_establishment = Establishment.new(
    profession: dentiste_profile.profession,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    contract_type: "Cession de local",
    street: "Rue de la Pépinière",
    department: dentiste_facility.department,
    zipcode: dentiste_facility.zipcode,
    city: dentiste_facility.city,
    premises_price: rand(100000...200000).to_s,
    premises_size: rand(40...80).to_s,
    premises_rooms_number: rand(2...4).to_s,
    premises_rent: rand(450...850).to_s,
    premises_furnished: false,
    premises_has_parking: Faker::Boolean.boolean,
    accessible_premises: Faker::Boolean.boolean,
    offer_type: Offer.offer_types.keys.sample
)

dentiste_establishment.user = dentiste
dentiste_establishment.save!

dentiste.save!

puts "👍  Création de la dentiste et de ses annonces"
puts ""
puts "👩‍⚕️‍ Création d'une osteopathe et de ses annonces ..."

osteopathe = User.new(
    email:  "osteopathe@mediswap.com",
    password: pwd,
)
osteopathe.skip_confirmation!
osteopathe.save!

puts "👤  Création du profil de l'ostéopathe ..."

osteopathe_profile = Profile.new(
    title: "madam",
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    profession: "Ostéopathe",
    professional_id_number: rand(10 ** 11).to_s
)

osteopathe_profile.user = osteopathe
osteopathe_profile.save!

puts "🏥  Création de l'établissement de l'ostéopathe ..."

osteopathe_facility = Facility.new(
    name: Faker::Company.name,
    category: FACILITY_CATEGORIES.sample,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    street: "Rue Paul Bert",
    department: "Rhône",
    zipcode: "69003",
    city: "Lyon"
)

osteopathe_facility.user = osteopathe
osteopathe_facility.save!

puts "📃  Création de l'offre de remplacement de l'ostéopathe ..."

osteopathe_replacement = Replacement.new(
    profession: osteopathe_profile.profession,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    contract_type: "Remplacement libéral occasionnel",
    street: osteopathe_facility.street,
    department: osteopathe_facility.department,
    zipcode: osteopathe_facility.zipcode,
    city: osteopathe_facility.city,
    working_time: Offer.working_times.keys.sample,
    starts_at: Faker::Date.between(from: Date.today, to: 1.month.from_now),
    ends_at: Faker::Date.between(from: 1.month.from_now, to: 2.month.from_now),
    retrocession: rand(70...100).to_s,
    daily_medical_acts_number: rand(10...30).to_s,
    on_call: Faker::Boolean.boolean,
    vehicle_required: Faker::Boolean.boolean,
    visit: Offer.visits.keys.sample,
    secretariat: Offer.secretariats.keys.sample,
    housing_possibility: Faker::Boolean.boolean,
    offer_type: Offer.offer_types.keys.sample
)

osteopathe_replacement.user = osteopathe
osteopathe_replacement.save!

puts "📃  Création de l'offre d'emploi de l'ostéopathe ..."

osteopathe_employment = Employment.new(
    profession: osteopathe_profile.profession,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    contract_type: Employment.contract_types.keys.sample,
    street: osteopathe_facility.street,
    department: osteopathe_facility.department,
    zipcode: osteopathe_facility.zipcode,
    city: osteopathe_facility.city,
    working_time: Offer.working_times.keys.sample,
    has_salary_set: true,
    salary: rand(2000...4000).to_s,
    salary_period: "Monthly",
    candidate_job_experience: Employment.candidate_job_experiences.keys.sample,
    candidate_description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    offer_type: Offer.offer_types.keys.sample
)

osteopathe_employment.user = osteopathe
osteopathe_employment.save!

puts "📃  Création de l'offre de collaboration de l'ostéopathe ..."

osteopathe_collaboration = Collaboration.new(
    profession: osteopathe_profile.profession,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    contract_type: Collaboration.contract_types.keys.sample,
    street: osteopathe_facility.street,
    department: osteopathe_facility.department,
    zipcode: osteopathe_facility.zipcode,
    city: osteopathe_facility.city,
    retrocession: rand(70...100).to_s,
    daily_medical_acts_number: rand(10...30).to_s,
    on_call: Faker::Boolean.boolean,
    vehicle_required: Faker::Boolean.boolean,
    visit: Offer.visits.keys.sample,
    secretariat: Offer.secretariats.keys.sample,
    housing_possibility: Faker::Boolean.boolean,
    offer_type: Offer.offer_types.keys.sample
)

osteopathe_collaboration.user = osteopathe
osteopathe_collaboration.save!

puts "📃  Création de l'offre de cession de patientèle de l'ostéopathe ..."

osteopathe_patient_transfer = PatientTransfer.new(
    profession: osteopathe_profile.profession,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    contract_type: PatientTransfer.contract_types.keys.sample,
    street: osteopathe_facility.street,
    department: osteopathe_facility.department,
    zipcode: osteopathe_facility.zipcode,
    city: osteopathe_facility.city,
    has_selling_price_set: false,
    revenues: rand(100000...200000).to_s,
    premises_size: rand(40...80).to_s,
    premises_rooms_number: rand(2...4).to_s,
    premises_availability: "Location",
    premises_rent: rand(450...850).to_s,
    premises_furnished: true,
    premises_equipment: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false),
    premises_has_parking: Faker::Boolean.boolean,
    accessible_premises: Faker::Boolean.boolean,
    offer_type: Offer.offer_types.keys.sample
)

osteopathe_patient_transfer.user = osteopathe
osteopathe_patient_transfer.save!

puts "📃  Création de l'offre d'installation de l'ostéopathe ..."

osteopathe_establishment = Establishment.new(
    profession: osteopathe_profile.profession,
    description: Faker::Lorem.paragraph_by_chars(number: 600, supplemental: false),
    contract_type: "Location de local",
    street: "Rue Duguesclin",
    department: osteopathe_facility.department,
    zipcode: osteopathe_facility.zipcode,
    city: osteopathe_facility.city,
    premises_size: rand(40...80).to_s,
    premises_rooms_number: rand(2...4).to_s,
    premises_rent: rand(450...850).to_s,
    premises_furnished: false,
    premises_has_parking: Faker::Boolean.boolean,
    accessible_premises: Faker::Boolean.boolean,
    offer_type: Offer.offer_types.keys.sample
)

osteopathe_establishment.user = osteopathe
osteopathe_establishment.save!

osteopathe.save!

puts "👍  Création de l'ostéopathe' et de ses annonces"

