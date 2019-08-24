# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Student, type: :model do
  it { is_expected.to have_and_belong_to_many(:attendances) }
  it { is_expected.to have_and_belong_to_many(:klasses) }
  it { is_expected.to have_many(:situations) }
  it { is_expected.to validate_presence_of(:name) }

  before do
    @student = create(:student)
    @klass = create(:klass)
    @attendances = create_list(:attendance, 3, realized_at: 1.day.from_now)
    @justification = create(:justification, klass: @klass.id, email: @student.email)
  end

  describe '#count_presence' do
    it 'checks if student was deactivate' do
      attendances = create_list(:attendance, 1, realized_at: 1.day.ago)
      # binding.pry
      student_status = create(:situation, klass: attendances.first.klasses.first, student: @student)
      situation = @student.count_presence(attendances, student_status.klass)
      expect(situation).to be(1)
    end

    it 'needs to count the student attendances' do
      count = @student.count_presence(@attendances, @student.klasses.first.id)
      expect(count).to be(3)
    end
  end

  describe '#justifications' do
    it 'counts if have any justification with status accepted' do
      justifications = @student.justifications(@klass.id, @student.email)
      expect(justifications).to be(1)
    end
  end
end
