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

  describe '#new' do
    it 'creates a attendance' do
      get new_admin_klass_attendance_path(@klass.first.id)
      attendance = build(:attendance)
      attendance.save
      expect(response).to be_successful
    end
  end

  describe '#update' do
    let(:attendance) { create(:attendance, name: 'Aula 1') }
    it 'changes attendance name' do
      attendance.update(name: 'Aula 2')
      expect(attendance.name).to eq('Aula 2')
    end
  end

  describe '#delete' do
    it 'deletes a group' do
      delete admin_klass_attendance_path(@klass.first.id, @attendances.first.id)
      expect(response).to redirect_to admin_klass_attendances_path(@klass.first.id)
    end
  end
end
