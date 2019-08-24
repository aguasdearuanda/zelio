# frozen_string_literal: true

FactoryBot.define do
  factory :situation do
    klass
    student
    active { false }
  end
end
