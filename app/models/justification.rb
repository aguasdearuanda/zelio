# frozen_string_literal: true

class Justification < ApplicationRecord
  has_attached_file :upload

  validates_attachment_content_type :upload, content_type: %r{\Aimage\/.*\Z}
  validates :name, :date, :email, :description, :status, presence: true
  enum status: {
    pendente: 'pendente',
    aceito: 'aceito',
    negado: 'negado'
  }

  scope :pending_justifications, ->(current_user) { where('status = ? AND email = ?', 'pendente', current_user.email) }
  scope :total_justifications, ->(current_user) { where(email: current_user.email).size }
end
