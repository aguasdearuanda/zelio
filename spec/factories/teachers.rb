# frozen_string_literal: true

FactoryBot.define do
  factory :teacher do
    name { Faker::Name.first_name }
    sequence(:email) { |n| "zelio_admin_#{n}@aguasdearuanda.com.br" }
    phone { '7998822332' }
    birthday { Faker::Date.birthday(18, 65) }
    klasses { |a| [a.association(:klass)] }
  end
end
