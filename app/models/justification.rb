# frozen_string_literal: true

class Justification < ApplicationRecord
  has_attached_file :upload

  validates_attachment_content_type :upload, content_type: %r{\Aimage\/.*\Z}
  validates :name, :date, :email, :description, presence: true
  enum status: {
    pendente: 'pendente',
    aceito: 'aceito',
    negado: 'negado'
  }
end
