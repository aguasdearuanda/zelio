# frozen_string_literal: true

class Group < ApplicationRecord
  validate :name
end
