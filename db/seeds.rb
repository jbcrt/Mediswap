require 'faker'

pwd = "password"

Offer.destroy_all
User.destroy_all

puts "Tout a été nettoyé !"
puts ""
puts "👨‍ Création des kinés et de leurs annonces"
puts "----------------------------------------------------------------"

kine_employeur_1 = User.new(
    email:  "kine1@meditest.com",
    password: pwd,
    title: 0,
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    account_type: "Praticien libéral installé",
    profession: "Masseur-kinésithérapeute",
    professional_id_number: rand(10 ** 11).to_s
)


offer_kine_1 = Offer.new(
    title: Faker::Lorem.sentence,
    profession: "Masseur-kinésithérapeute",
    offer_type: ["Remplacement occasionnel", "Remplacement régulier", "Collaboration", "Association", "Cession"].sample,
    starts_at: Faker::Date.between(from: Date.today, to: 1.month.from_now),
    ends_at: Faker::Date.between(from: 1.month.from_now, to: 2.month.from_now),
    offer_address: "1 rue de la Guignette",
    offer_postal_code_address: "17000",
    offer_city_address: "La Rochelle",
    description: Faker::Lorem.paragraph(sentence_count: 15),
    retrocession: rand(70...100).to_s,
    vehicle_required: Faker::Boolean.boolean,
    home_visits: Faker::Boolean.boolean,
    medical_institution_visits: Faker::Boolean.boolean,
    housing_possibility: Faker::Boolean.boolean,
    secretariat: Faker::Boolean.boolean,
    urgent: Faker::Boolean.boolean, 
    premium: Faker::Boolean.boolean 
)

offer_kine_1.user = kine_employeur_1
offer_kine_1.save!
kine_employeur_1.save!

puts "👍 Création du kiné 1 et de son annonce OK"

kine_employeur_2 = User.new(
    email:  "kine2@meditest.com",
    password: pwd,
    title: 1,
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    account_type: "Praticien libéral installé",
    profession: "Masseur-kinésithérapeute",
    professional_id_number: rand(10 ** 11).to_s
)


offer_kine_2 = Offer.new(
    title: Faker::Lorem.sentence,
    profession: "Masseur-kinésithérapeute",
    offer_type: ["Remplacement occasionnel", "Remplacement régulier", "Collaboration", "Association", "Cession"].sample,
    starts_at: Faker::Date.between(from: Date.today, to: 1.month.from_now),
    ends_at: Faker::Date.between(from: 1.month.from_now, to: 2.month.from_now),
    offer_address: "1 rue du Noroit",
    offer_postal_code_address: "17180",
    offer_city_address: "Périgny",
    description: Faker::Lorem.paragraph(sentence_count: 15),
    retrocession: rand(70...100).to_s,
    vehicle_required: Faker::Boolean.boolean,
    home_visits: Faker::Boolean.boolean,
    medical_institution_visits: Faker::Boolean.boolean,
    housing_possibility: Faker::Boolean.boolean,
    secretariat: Faker::Boolean.boolean,
    urgent: Faker::Boolean.boolean, 
    premium: Faker::Boolean.boolean 
  )

offer_kine_2.user = kine_employeur_2
offer_kine_2.save!
kine_employeur_2.save!

puts "👍 Création du kiné 2 et de son annonce OK"

kine_employeur_3 = User.new(
    email:  "kine3@meditest.com",
    password: pwd,
    title: 0,
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    account_type: "Praticien libéral installé",
    profession: "Masseur-kinésithérapeute",
    professional_id_number: rand(10 ** 11).to_s
)


offer_kine_3 = Offer.new(
    title: Faker::Lorem.sentence,
    profession: "Masseur-kinésithérapeute",
    offer_type: ["Remplacement occasionnel", "Remplacement régulier", "Collaboration", "Association", "Cession"].sample,
    starts_at: Faker::Date.between(from: Date.today, to: 1.month.from_now),
    ends_at: Faker::Date.between(from: 1.month.from_now, to: 2.month.from_now),
    offer_address: "52 rue de La Rochelle",
    offer_postal_code_address: "17220",
    offer_city_address: "Saint Rogatien",
    description: Faker::Lorem.paragraph(sentence_count: 15),
    retrocession: rand(70...100).to_s,
    vehicle_required: Faker::Boolean.boolean,
    home_visits: Faker::Boolean.boolean,
    medical_institution_visits: Faker::Boolean.boolean,
    housing_possibility: Faker::Boolean.boolean,
    secretariat: Faker::Boolean.boolean,
    urgent: Faker::Boolean.boolean, 
    premium: Faker::Boolean.boolean 
)

offer_kine_3.user = kine_employeur_3
offer_kine_3.save!
kine_employeur_3.save!

puts "👍 Création du kiné 3 et de son annonce OK"

kine_employeur_4 = User.new(
    email:  "kine4@meditest.com",
    password: pwd,
    title: 1,
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    account_type: "Praticien libéral installé",
    profession: "Masseur-kinésithérapeute",
    professional_id_number: rand(10 ** 11).to_s
)


offer_kine_4 = Offer.new(
    title: Faker::Lorem.sentence,
    profession: "Masseur-kinésithérapeute",
    offer_type: ["Remplacement occasionnel", "Remplacement régulier", "Collaboration", "Association", "Cession"].sample,
    starts_at: Faker::Date.between(from: Date.today, to: 1.month.from_now),
    ends_at: Faker::Date.between(from: 1.month.from_now, to: 2.month.from_now),
    offer_address: "4 Rue Valpastour",
    offer_postal_code_address: "17220",
    offer_city_address: "Saint-Médard-d'Aunis",
    description: Faker::Lorem.paragraph(sentence_count: 15),
    retrocession: rand(70...100).to_s,
    vehicle_required: Faker::Boolean.boolean,
    home_visits: Faker::Boolean.boolean,
    medical_institution_visits: Faker::Boolean.boolean,
    housing_possibility: Faker::Boolean.boolean,
    secretariat: Faker::Boolean.boolean,
    urgent: Faker::Boolean.boolean, 
    premium: Faker::Boolean.boolean 
)

offer_kine_4.user = kine_employeur_4
offer_kine_4.save!
kine_employeur_4.save!

puts "👍 Création du kiné 4 et de son annonce OK"

kine_employeur_5 = User.new(
    email:  "kine5@meditest.com",
    password: pwd,
    title: 0,
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    account_type: "Praticien libéral installé",
    profession: "Masseur-kinésithérapeute",
    professional_id_number: rand(10 ** 11).to_s
)


offer_kine_5 = Offer.new(
    title: Faker::Lorem.sentence,
    profession: "Masseur-kinésithérapeute",
    offer_type: ["Remplacement occasionnel", "Remplacement régulier", "Collaboration", "Association", "Cession"].sample,
    starts_at: Faker::Date.between(from: Date.today, to: 1.month.from_now),
    ends_at: Faker::Date.between(from: 1.month.from_now, to: 2.month.from_now),
    offer_address: "25 Avenue Edmond Grasset",
    offer_postal_code_address: "17440",
    offer_city_address: "Aytré",
    description: Faker::Lorem.paragraph(sentence_count: 15),
    retrocession: rand(70...100).to_s,
    vehicle_required: Faker::Boolean.boolean,
    home_visits: Faker::Boolean.boolean,
    medical_institution_visits: Faker::Boolean.boolean,
    housing_possibility: Faker::Boolean.boolean,
    secretariat: Faker::Boolean.boolean,
    urgent: Faker::Boolean.boolean, 
    premium: Faker::Boolean.boolean 
)

offer_kine_5.user = kine_employeur_5
offer_kine_5.save!
kine_employeur_5.save!

puts "👍 Création du kiné 5 et de son annonce OK"
puts ""
puts "Tous les kinés et leurs annonces ont été crées !"
puts ""
puts "👨‍ Création des médecins généralistes et de leurs annonces"
puts "----------------------------------------------------------------"

med_gen_employeur_1 = User.new(
    email:  "med_gen1@meditest.com",
    password: pwd,
    title: 0,
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    account_type: "Praticien libéral installé",
    profession: "Médecin généraliste",
    professional_id_number: rand(10 ** 11).to_s
)


offer_med_gen_1 = Offer.new(
    title: Faker::Lorem.sentence,
    profession: "Médecin généraliste",
    offer_type: ["Remplacement occasionnel", "Remplacement régulier", "Collaboration", "Association", "Cession"].sample,
    starts_at: Faker::Date.between(from: Date.today, to: 1.month.from_now),
    ends_at: Faker::Date.between(from: 1.month.from_now, to: 2.month.from_now),
    offer_address: "Place des Chênes Verts",
    offer_postal_code_address: "17180",
    offer_city_address: "Saint Rogatien",
    description: Faker::Lorem.paragraph(sentence_count: 15),
    retrocession: rand(70...100).to_s,
    vehicle_required: Faker::Boolean.boolean,
    home_visits: Faker::Boolean.boolean,
    medical_institution_visits: Faker::Boolean.boolean,
    housing_possibility: Faker::Boolean.boolean,
    secretariat: Faker::Boolean.boolean,
    urgent: Faker::Boolean.boolean, 
    premium: Faker::Boolean.boolean 
)

offer_med_gen_1.user = med_gen_employeur_1
offer_med_gen_1.save!
med_gen_employeur_1.save!

puts "👍 Création du médécin généraliste 1 et de son annonce OK"

med_gen_employeur_2 = User.new(
    email:  "med_gen2@meditest.com",
    password: pwd,
    title: 0,
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    account_type: "Praticien libéral installé",
    profession: "Médecin généraliste",
    professional_id_number: rand(10 ** 11).to_s
)


offer_med_gen_2 = Offer.new(
    title: Faker::Lorem.sentence,
    profession: "Médecin généraliste",
    offer_type: ["Remplacement occasionnel", "Remplacement régulier", "Collaboration", "Association", "Cession"].sample,
    starts_at: Faker::Date.between(from: Date.today, to: 1.month.from_now),
    ends_at: Faker::Date.between(from: 1.month.from_now, to: 2.month.from_now),
    offer_address: "3 Rue de la Désirée",
    offer_postal_code_address: "17000",
    offer_city_address: "La Rochelle",
    description: Faker::Lorem.paragraph(sentence_count: 15),
    retrocession: rand(70...100).to_s,
    vehicle_required: Faker::Boolean.boolean,
    home_visits: Faker::Boolean.boolean,
    medical_institution_visits: Faker::Boolean.boolean,
    housing_possibility: Faker::Boolean.boolean,
    secretariat: Faker::Boolean.boolean,
    urgent: Faker::Boolean.boolean, 
    premium: Faker::Boolean.boolean 
)

offer_med_gen_2.user = med_gen_employeur_2
offer_med_gen_2.save!
med_gen_employeur_2.save!

puts "👍 Création du médécin généraliste 2 et de son annonce OK"

med_gen_employeur_3 = User.new(
    email:  "med_gen3@meditest.com",
    password: pwd,
    title: 0,
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    account_type: "Praticien libéral installé",
    profession: "Médecin généraliste",
    professional_id_number: rand(10 ** 11).to_s
)


offer_med_gen_3 = Offer.new(
    title: Faker::Lorem.sentence,
    profession: "Médecin généraliste",
    offer_type: ["Remplacement occasionnel", "Remplacement régulier", "Collaboration", "Association", "Cession"].sample,
    starts_at: Faker::Date.between(from: Date.today, to: 1.month.from_now),
    ends_at: Faker::Date.between(from: 1.month.from_now, to: 2.month.from_now),
    offer_address: "14 Rue de Valençay",
    offer_postal_code_address: "17180",
    offer_city_address: "Périgny",
    description: Faker::Lorem.paragraph(sentence_count: 15),
    retrocession: rand(70...100).to_s,
    vehicle_required: Faker::Boolean.boolean,
    home_visits: Faker::Boolean.boolean,
    medical_institution_visits: Faker::Boolean.boolean,
    housing_possibility: Faker::Boolean.boolean,
    secretariat: Faker::Boolean.boolean,
    urgent: Faker::Boolean.boolean, 
    premium: Faker::Boolean.boolean 
)

offer_med_gen_3.user = med_gen_employeur_3
offer_med_gen_3.save!
med_gen_employeur_3.save!

puts "👍 Création du médécin généraliste 3 et de son annonce OK"

med_gen_employeur_4 = User.new(
    email:  "med_gen4@meditest.com",
    password: pwd,
    title: 0,
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    account_type: "Praticien libéral installé",
    profession: "Médecin généraliste",
    professional_id_number: rand(10 ** 11).to_s
)


offer_med_gen_4 = Offer.new(
    title: Faker::Lorem.sentence,
    profession: "Médecin généraliste",
    offer_type: ["Remplacement occasionnel", "Remplacement régulier", "Collaboration", "Association", "Cession"].sample,
    starts_at: Faker::Date.between(from: Date.today, to: 1.month.from_now),
    ends_at: Faker::Date.between(from: 1.month.from_now, to: 2.month.from_now),
    offer_address: "2 Rue des Marmottes",
    offer_postal_code_address: "17138",
    offer_city_address: "Saint-Xandre",
    description: Faker::Lorem.paragraph(sentence_count: 15),
    retrocession: rand(70...100).to_s,
    vehicle_required: Faker::Boolean.boolean,
    home_visits: Faker::Boolean.boolean,
    medical_institution_visits: Faker::Boolean.boolean,
    housing_possibility: Faker::Boolean.boolean,
    secretariat: Faker::Boolean.boolean,
    urgent: Faker::Boolean.boolean, 
    premium: Faker::Boolean.boolean 
)

offer_med_gen_4.user = med_gen_employeur_4
offer_med_gen_4.save!
med_gen_employeur_4.save!

puts "👍 Création du médécin généraliste 4 et de son annonce OK"

med_gen_employeur_5 = User.new(
    email:  "med_gen5@meditest.com",
    password: pwd,
    title: 0,
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name,
    account_type: "Praticien libéral installé",
    profession: "Médecin généraliste",
    professional_id_number: rand(10 ** 11).to_s
)


offer_med_gen_5 = Offer.new(
    title: Faker::Lorem.sentence,
    profession: "Médecin généraliste",
    offer_type: ["Remplacement occasionnel", "Remplacement régulier", "Collaboration", "Association", "Cession"].sample,
    starts_at: Faker::Date.between(from: Date.today, to: 1.month.from_now),
    ends_at: Faker::Date.between(from: 1.month.from_now, to: 2.month.from_now),
    offer_address: "97 Rue nationale",
    offer_postal_code_address: "17220",
    offer_city_address: "La Jarne",
    description: Faker::Lorem.paragraph(sentence_count: 15),
    retrocession: rand(70...100).to_s,
    vehicle_required: Faker::Boolean.boolean,
    home_visits: Faker::Boolean.boolean,
    medical_institution_visits: Faker::Boolean.boolean,
    housing_possibility: Faker::Boolean.boolean,
    secretariat: Faker::Boolean.boolean,
    urgent: Faker::Boolean.boolean, 
    premium: Faker::Boolean.boolean 
)

offer_med_gen_5.user = med_gen_employeur_5
offer_med_gen_5.save!
med_gen_employeur_5.save!

puts "👍 Création du médécin généraliste 5 et de son annonce OK"
puts ""
puts "Tous les médecins généralistes et leurs annonces ont été crées !"