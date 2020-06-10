# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Klass, type: :model do
  it { is_expected.to have_and_belong_to_many(:students) }
  it { is_expected.to have_and_belong_to_many(:teachers) }
  it { is_expected.to have_and_belong_to_many(:attendances) }
  it { is_expected.to have_many(:situations) }
  it { is_expected.to validate_presence_of(:name) }

  describe '#disable' do
    let(:klass) { create(:klass) }

    it 'checks active status as true' do
      expect(klass.active).to be true
    end

    it 'changes the klass active status to false' do
      klass.disable
      expect(klass.active).to be false
    end
  end

  describe '#disable_student' do
    let(:klass) { create(:klass) }
    let(:student) { create(:student) }

    it 'students does not have any situation' do
      expect(student.situations).not_to be_any
    end

    it 'disable student for the specific group class' do
      klass.disable_student(student.id)
      expect(student.situations).to be_any
    end
  end

  describe '#active_students' do
    before do
      @klass = create(:klass)
      @students = create_list(:student, 3, klass_ids: [@klass.id])
    end


    it 'check how many students in the class' do
      expect(@klass.students.count).to be_equal(3)
    end

    context 'when disable a student' do
      it 'show only active students' do
        student = @students.first
        expect(student.situations).not_to be_any
        @klass.disable_student(student.id)
        expect(@klass.active_students.count).to be_equal(2)
      end
    end
  end
end
