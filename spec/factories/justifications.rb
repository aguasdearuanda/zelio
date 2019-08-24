# frozen_string_literal: true

FactoryBot.define do
  factory :justification do
    name { Faker::Name.first_name }
    sequence(:email) { |n| "zelio_admin_#{n}@aguasdearuanda.com.br" }
    klass
    description { 'test justification' }
    date { Time.zone.today }
    status { 'aceito' }
  end
end
