# frozen_string_literal: true

class Justification < ApplicationRecord
  has_one_attached :upload
  validates :name, :date, :email, :description, presence: true
  enum status: {
    pendente: 'pendente',
    aceito: 'aceito',
    negado: 'negado'
  }
end
