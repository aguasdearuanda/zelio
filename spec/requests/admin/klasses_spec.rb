# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Klasses management', type: :request do
  before do
    sign_in admin
  end

  let(:admin) { create(:admin) }
  let(:klass) { create(:klass) }

  describe '#index' do
    context 'when has group' do
      let(:klasses) { create_list(:klass, 3) }

      it 'lists all groups' do
        get admin_klasses_path
        expect(klasses.count).to be_equal(3)
      end
    end
  end

  describe '#show' do
    it 'shows a class' do
      get admin_klass_path(klass.id)
      expect(response).to be_successful
    end
  end

  describe '#new' do
    it 'creates a class' do
      get new_admin_klass_path
      klass = build(:klass)
      klass.save
      expect(response).to be_successful
    end
  end

  describe '#create' do
    it 'creates a class' do
      post admin_klasses_path, params: { klass: { name: 'turma 1' } }
      expect(response).to redirect_to(admin_klasses_path)
    end

    it 'will not create a class' do
      post admin_klasses_path, params: { klass: { name: '' } }
      expect(response).to render_template :new
    end
  end

  describe '#edit' do
    it 'edit a class' do
      get edit_admin_klass_path(klass.id)
      expect(response).to render_template :edit
    end
  end

  describe '#update' do
    it 'update a class with success' do
      put admin_klass_path(id: klass.id),
          params: { klass: { name: 'turma x' } }
      expect(response).to redirect_to admin_klasses_path
    end

    it 'will redirect to edit page if something went wrong' do
      put admin_klass_path(id: klass.id),
          params: { klass: { name: '' } }
      expect(response).to render_template :edit
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes a class' do
      klass = create(:klass)
      expect { delete admin_klass_path(klass) }.to change(Klass, :count).by(-1)
    end

    it 'redirects to klasses#index' do
      delete admin_klass_path(klass)
      expect(response).to redirect_to admin_klasses_path
    end
  end

  describe '#disable_student' do
    let(:student) { create(:student) }

    it 'students does not have any situation' do
      expect(student.situations).not_to be_any
    end

    it 'disable student for the specific group class' do
      klass = student.klasses.first
      get admin_klass_disable_student_path(klass_id: klass.id, student_id: student.id)
      expect(response).to redirect_to admin_klasses_path
    end
  end
end
