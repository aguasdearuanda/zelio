# frozen_string_literal: true

class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  has_and_belongs_to_many :klasses
  has_and_belongs_to_many :attendances
  has_many :situations
  validates :name, presence: true

  def count_presence(attendances, klass)
    period = check_situations(attendances, klass)
    period_attendances(period)
  end

  def check_situations(attendances, klass)
    period = []

    if situations.where(klass_id: klass).present?
      attendances.each do |attendance|
        period << attendance if attendance.realized_at <= situations.first.created_at
      end
    else
      attendances.each do |attendance|
        period << attendance if attendance.realized_at >= created_at
      end
    end

    period
  end

  def period_attendances(period)
    # 1st scenario: the student was disabled so the next classes attendance,
    # should not be counted.
    # 2nd scenario: the student joined on the group days later after began
    # the first class then we should not count the classes attendances behind
    # the day that he joined the group klass.
    count = 0
    period.each do |attended|
      count += 1 if attended.students.where(id: id).empty?
    end
    count
  end

  def show_attendances(attendances, klass)
    attendance = []
    period = check_situations(attendances, klass)
    period.each do |klasses|
      attendance << klasses.name if klasses.students.where(id: id).empty?
    end
    attendance.join('<br>').html_safe
  end

  def check_justifications(klass, email)
    Justification.where('klass = ? AND email = ? AND status = ?', klass, email, 'aceito').size
  end

  def justifications
    Justification.all.where(email: email)
  end
end
