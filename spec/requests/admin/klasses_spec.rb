# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Klasses management', type: :request do
  before do
    sign_in admin
  end

  let(:admin) { create(:admin) }
  describe '#index' do
    context 'when has group' do
      let(:klasses) { create_list(:klass, 3) }
      it 'lists all groups' do
        get admin_klasses_path
        expect(klasses.count).to be_equal(3)
      end
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

  describe '#update' do
    let(:klass) { create(:klass, name: 'aula1') }
    it 'changes klass name' do
      klass.update(name: 'aula2')
      expect(klass.name).to eq('aula2')
    end
  end

  describe '#delete' do
    let(:klass) { create(:klass) }
    it 'deletes a group' do
      delete admin_klass_path(klass)
      expect(response).to redirect_to admin_klasses_path
    end
  end

  describe '#disable_student' do
    before do
      @student = create(:student)
    end

    it 'students does not have any situation' do
      expect(@student.situations.any?).to be_falsy
    end

    it 'disable student for the specific group klass' do
      klass = @student.klasses.first
      klass.disable_student(@student.id)
      expect(@student.situations.first.active).to be_equal(false)
    end
  end
end
