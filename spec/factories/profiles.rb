FactoryBot.define do
  factory :profile do
    title { :mister }
    first_name { "John" }
    last_name { "Doe" }
    profession { PROFESSIONS.sample }
    professional_id_number { "12345678910" }
  end
end
