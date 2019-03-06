# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Student, type: :model do
  it { is_expected.to have_and_belong_to_many(:attendances) }
  it { is_expected.to have_and_belong_to_many(:klasses) }
  it { is_expected.to have_many(:situations) }
  it { is_expected.to validate_presence_of(:name) }

  describe '#count_presence' do
    before do
      @student = create(:student)
    end

    xit 'needs to count the student attendances' do
    end
  end
end
