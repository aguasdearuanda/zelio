# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Situation, type: :model do
  it { is_expected.to belong_to(:klass) }
  it { is_expected.to belong_to(:student) }
end
