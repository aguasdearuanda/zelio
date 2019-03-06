# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Students management', type: :request do
  before do
    sign_in admin
  end

  let(:admin) { create(:admin) }
  describe '#index' do
    context 'when has group' do
      let(:students) { create_list(:student, 3) }
      it 'lists all groups' do
        get admin_students_path
        expect(students.count).to be_equal(3)
      end
    end
  end

  describe '#new' do
    it 'creates a student' do
      get new_admin_student_path
      student = build(:student)
      student.save
      expect(response).to be_successful
    end
  end

  describe '#update' do
    let(:student) { create(:student, name: 'Shevchenko Test') }
    it 'changes student name' do
      student.update(name: 'Davi Thiesse')
      expect(student.name).to eq('Davi Thiesse')
    end
  end
end
