# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin justifications', type: :request do
  before do
    sign_in admin
  end

  let(:admin) { create(:admin) }
  let(:student) { create(:student) }
  let(:justifications) { create_list(:justification, 3, email: student.email) }

  describe '#index' do
    before do
      get admin_justifications_path
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'shows all the student justifications' do
      expect(justifications.count).to eq(3)
    end
  end

  describe '#show' do
    it 'shows a justification' do
      get admin_justification_path(justifications.first.id)
      expect(response).to be_successful
    end
  end

  describe '#update' do
    it 'updates the justification status' do
      put admin_justification_path(justifications.first.id), params: { justification: { status: 'aceito' } }
      expect(justifications.first.status).to eq('aceito')
      expect(response).to redirect_to admin_justifications_path
    end
  end

  describe '#destroy' do
    it 'deletes a justification' do
      delete admin_justification_path(justifications.first.id)
      expect(response).to redirect_to admin_justifications_path
    end
  end
end
