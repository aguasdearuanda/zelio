# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StudentHelper, type: :helper do
  describe '#label_for_active' do
    it 'changes button when getting active true' do
      expect(helper.label_for_active(true)).to eq \
        '<span class="btn btn-success btn-sm btn-rounded">Ativado</span>'
    end

    it 'changes button when getting active false' do
      expect(helper.label_for_active(false)).to eq \
        '<span class="btn btn-danger btn-sm btn-rounded">Desativado</span>'
    end
  end

  describe '#label_for_klass_student_status' do
    it 'changes button when getting status as active' do
      expect(helper.label_for_klass_student_status('ativo')).to eq \
        '<span class="btn btn-success btn-sm btn-rounded">Ativado</span>'
    end

    it 'changes button when getting status as disable' do
      expect(helper.label_for_klass_student_status('')).to eq \
        '<span class="btn btn-danger btn-sm btn-rounded">Desativado</span>'
    end
  end

  describe '#klasses' do
    let(:attendances) { create_list(:attendance, 3) }
    let(:student) { attendances.first.students.first }
    let(:klass) { attendances.first.klasses.first }

    it do
      expect(helper.klasses(student, attendances, klass)).not_to be_blank
    end
  end

  describe '#absenses' do
    let(:attendances)  { create_list(:attendance, 3) }
    let(:student) { attendances.first.students.first }
    let(:klass) { attendances.first.klasses.first }

    it do
      expect(helper.absences(student, attendances, klass)).to be_an_instance_of(Integer)
    end
  end

  describe '#justifications' do
    let(:attendances) { create_list(:attendance, 3) }
    let(:student) { attendances.first.students.first }
    let(:klass) { attendances.first.klasses.first }

    it do
      expect(helper.justifications(student, klass)).to be_an_instance_of(Integer)
    end
  end
end
