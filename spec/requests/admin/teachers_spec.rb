# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Teachers management', type: :request do
  before do
    sign_in admin
  end

  let(:admin) { create(:admin) }
  describe '#index' do
    context 'when has group' do
      let(:teachers) { create_list(:teacher, 3) }
      it 'lists all groups' do
        get admin_students_path
        expect(teachers.count).to be_equal(3)
      end
    end
  end

  describe '#new' do
    it 'creates a student' do
      get new_admin_student_path
      teacher = build(:teacher)
      teacher.save
      expect(response).to be_successful
    end
  end

  describe '#update' do
    let(:teacher) { create(:teacher, name: 'Shevchenko Test') }
    it 'changes student name' do
      teacher.update(name: 'Davi Thiesse')
      expect(teacher.name).to eq('Davi Thiesse')
    end
  end
end
