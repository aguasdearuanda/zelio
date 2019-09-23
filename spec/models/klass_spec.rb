# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Klass, type: :model do
  it { is_expected.to have_and_belong_to_many(:students) }
  it { is_expected.to have_and_belong_to_many(:teachers) }
  it { is_expected.to have_and_belong_to_many(:attendances) }
  it { is_expected.to have_many(:situations) }
  it { is_expected.to validate_presence_of(:name) }
end
