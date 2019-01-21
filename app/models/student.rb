# frozen_string_literal: true

class Student < ApplicationRecord
  include ApplicationHelper

  has_and_belongs_to_many :klasses
  has_and_belongs_to_many :attendances

  def count_presence(attendances)
    count = []

    if self.disabled_at.present?
      count = attendances.where('realized_at <= ?', self.disabled_at).size
      count = count - self.attendances.size
    else
      count = attendances.size - self.attendances.size
    end

    count = (count.to_f/attendances.size.to_f*100)
    convert_to_percentage(count)
  end

  def disable
    self.update(active: false, disabled_at: Time.current)
  end
end
