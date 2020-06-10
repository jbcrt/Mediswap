FactoryBot.define do
  factory :facility do    
    name { Faker::Company.name }
    category { FACILITY_CATEGORIES.sample }
    description { Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false) }
    street { "1 Avenue du Général de Gaulle" }
    department { "Charente-Maritime" }
    zipcode { "17000" }
    city { "La Rochelle" }
  end
end
