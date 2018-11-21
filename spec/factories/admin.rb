FactoryBot.define do
  factory :admin do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    sequence(:email) { |n| "zelio_admin_#{n}@aguasdearuanda.com.br" }
    password { '1234567890' }
  end
end
