# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Attendances management', type: :request do
  before do
    sign_in admin
    @attendances = create_list(:attendance, 3)
    @klass = @attendances.first.klasses.each(&:id)
  end

  let(:admin) { create(:admin) }
  describe '#index' do
    context 'when have attendances' do
      it 'lists all attendances' do
        get admin_klass_attendances_path(@klass.first.id)
        expect(@attendances.count).to be_equal(3)
      end
    end
  end

  describe '#show' do
    it 'shows a attendance' do
      get admin_klass_attendance_path(@klass.first.id, @attendances.first.id)
      expect(response).to be_successful
    end
  end

  describe '#new' do
    it 'creates a attendance' do
      get new_admin_klass_attendance_path(@klass.first.id)
      attendance = build(:attendance)
      attendance.save
      expect(response).to be_successful
    end
  end

  describe '#create' do
    it 'creates a attendance' do
      post admin_klass_attendances_path(klass_id: @klass.first.id),
           params: { attendance: { name: 'aula1' } }
      expect(response).to redirect_to(admin_klass_attendances_path)
    end

    it 'will not create a attendance' do
      post admin_klass_attendances_path(klass_id: @klass.first.id),
           params: { attendance: { name: '' } }
      expect(response).to render_template :new
    end
  end

  describe '#edit' do
    it 'edit a attendance' do
      get edit_admin_klass_attendance_path(@klass.first.id, @attendances.first.id)
      expect(response).to be_successful
    end
  end

  describe '#update' do
    it 'update a attendance with success' do
      put admin_klass_attendance_path(klass_id: @klass.first.id, id: @attendances.first.id),
          params: { attendance: { name: 'aula x' } }
      expect(response).to redirect_to admin_klass_attendances_path(@klass.first.id)
    end

    it 'will redirect to edit page if something went wrong' do
      put admin_klass_attendance_path(klass_id: @klass.first.id, id: @attendances.first.id),
          params: { attendance: { name: '' } }
      expect(response).to render_template :edit
    end
  end

  describe '#delete' do
    it 'deletes a group' do
      delete admin_klass_attendance_path(@klass.first.id, @attendances.first.id)
      expect(response).to redirect_to admin_klass_attendances_path(@klass.first.id)
    end
  end
end
