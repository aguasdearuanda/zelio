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
    context 'with valid attributes' do
      before do
        patch admin_justification_path(justifications.first.id),
              params: { justification: { status: 'aceito' } }
      end

      it 'changes the justification`s attribute' do
        justifications.first.reload
        expect(justifications.first.status).to eq('aceito')
      end

      it 'redirects to justifications#index' do
        expect(response).to redirect_to admin_justifications_path
      end
    end

    context 'with invalid attributes' do
      it 'render :edit template' do
        patch admin_justification_path(justifications.first.id),
              params: { justification: { status: nil } }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe '#edit' do
    it 'renders a justification to edit template' do
      get edit_admin_justification_path(justifications.first.id)
      expect(response).to render_template :edit
    end
  end

  describe 'DELETE #destroy' do
    before do
      @justification = create(:justification)
    end

    it 'deletes a justification' do
      expect { delete admin_justification_path(@justification) }.to change(Justification, :count).by(-1)
    end

    it 'redirects to justifications#index' do
      delete admin_justification_path(@justification)
      expect(response).to redirect_to admin_justifications_path
    end
  end
end
