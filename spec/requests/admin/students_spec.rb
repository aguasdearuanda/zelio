# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Students management', type: :request do
  before do
    sign_in admin
  end

  let(:admin) { create(:admin) }
  let(:student) { create(:student) }

  describe '#index' do
    context 'when has group' do
      let(:students) { create_list(:student, 3) }

      it 'lists all groups' do
        get admin_students_path
        expect(students.count).to be_equal(3)
      end
    end
  end

  describe '#show' do
    it 'shows a student' do
      get admin_student_path(student.id)
      expect(response).to be_successful
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

  describe '#create' do
    it 'creates a student' do
      post admin_students_path, params: { student: { name: 'Davi Thiesse' } }
      expect(response).to redirect_to(admin_students_path)
    end

    it 'will not create a student' do
      post admin_students_path, params: { student: { name: '' } }
      expect(response).to render_template :new
    end
  end

  describe '#edit' do
    it 'edit a student' do
      get edit_admin_student_path(student.id)
      expect(response).to render_template :edit
    end
  end

  describe '#update' do
    it 'update a student with success' do
      put admin_student_path(id: student.id),
          params: { student: { name: 'Bruce Lee' } }
      expect(response).to redirect_to admin_students_path
    end

    it 'will redirect to edit page if something went wrong' do
      put admin_student_path(id: student.id),
          params: { student: { name: '' } }
      expect(response).to render_template :edit
    end
  end
end
