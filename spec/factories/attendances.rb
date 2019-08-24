# frozen_string_literal: true

FactoryBot.define do
  factory :attendance do
    name { Faker::Name.first_name }
    klasses { |a| [a.association(:klass)] }
    students { |a| [a.association(:student)] }
    created_at { Time.zone.today }
    realized_at { 1.day.from_now }
  end
end
