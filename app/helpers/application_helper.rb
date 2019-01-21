# frozen_string_literal: true

module ApplicationHelper
  include ActionView::Helpers::NumberHelper

  def convert_to_percentage(value)
    number_to_percentage(value, precision: 0)
  end
end
