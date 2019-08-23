# frozen_string_literal: true

FactoryBot.define do
  factory :attendance do
    name { Faker::Name.first_name }
    klasses { |a| [a.association(:klass)] }
    students { |a| [a.association(:student)] }
    created_at { Date.today }
    realized_at { Date.today }
  end
end
