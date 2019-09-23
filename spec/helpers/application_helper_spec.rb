# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#convert_to_percentage' do
    it do
      count = 10 / 2.to_f
      expect(helper.convert_to_percentage(count)).to eq '5%'
    end
  end
end
