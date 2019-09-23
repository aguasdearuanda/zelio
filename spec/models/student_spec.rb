# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Student, type: :model do
  let(:student) { create(:student) }
  let(:klass) { create(:klass) }
  let(:attendances) { create_list(:attendance, 3, realized_at: 1.day.from_now) }

  it { is_expected.to have_and_belong_to_many(:attendances) }
  it { is_expected.to have_and_belong_to_many(:klasses) }
  it { is_expected.to have_many(:situations) }
  it { is_expected.to validate_presence_of(:name) }

  describe '#count_presence' do
    it 'checks if student was deactivated' do
      attendances = create_list(:attendance, 1, realized_at: 1.day.ago)
      student_status = create(:situation, klass: attendances.first.klasses.first,
                                          student: student)
      situation = student.count_presence(attendances, student_status.klass)
      expect(situation).to be(1)
    end

    it 'needs to count the student attendances' do
      count = student.count_presence(attendances, student.klasses.first.id)
      expect(count).to be(3)
    end
  end

  describe '#show_attendances' do
    it 'shows the deactivated student attendances classes' do
      attendances = create_list(:attendance, 1, realized_at: 1.day.ago)
      student_status = create(:situation, klass: attendances.first.klasses.first,
                                          student: student)
      response = student.show_attendances(attendances, student_status.klass)
      expect(response).to be_a(String)
    end

    it 'shows the student attendances classes' do
      response = student.show_attendances(attendances, student.klasses.first.id)
      expect(response).to be_a(String)
    end
  end

  describe '#justifications' do
    it 'counts if has any justification with status accepted' do
      create(:justification, klass: klass.id, email: student.email)
      count_justification = student.check_justifications(klass.id, student.email)
      expect(count_justification).to be(1)
    end
  end
end
