# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Student justifications', type: :request do
  before do
    sign_in student
  end

  let(:student) { create(:student) }
  let(:justifications) { create_list(:justification, 3, email: student.email) }

  describe '#index' do
    before do
      get student_justifications_path
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'shows all the student justifications' do
      expect(justifications.count).to eq(3)
    end

    it 'checks if the justification is from the current student' do
      expect(justifications.first.email).to eq(student.email)
    end
  end

  describe '#show' do
    it 'shows a justification' do
      get student_justification_path(justifications.first.id)
      expect(response).to be_successful
    end
  end

  describe '#new' do
    before do
      get new_student_justification_path
    end

    it 'assigns a new Justification to @justification' do
      expect(assigns(:justification)).to be_a_new Justification
    end

    it 'renders the new template' do
      expect(response).to render_template(:new)
    end
  end

  describe '#create' do
    let(:justification_attributes) do
      attributes_for(:justification, name: student.name,
                                     email: student.email,
                                     date: Time.current,
                                     description: 'teste')
    end

    context 'with valid attributes' do
      it 'saves the new justification in the database' do
        expect do
          post student_justifications_path, params: { justification: justification_attributes }
        end.to change(Justification, :count).by(1)
      end

      it 'redirects to justification#show' do
        post student_justifications_path, params: { justification: justification_attributes }
        expect(response).to redirect_to student_justification_path(assigns(:justification))
      end
    end

    context 'with invalid attributes' do
      let(:justification_attributes) do
        attributes_for(:justification, name: nil)
      end

      it 'will not create a justification' do
        expect do
          post student_justifications_path, params: { justification: justification_attributes }
        end.to change(Justification, :count).by(0)
      end

      it 'renders the new template' do
        post student_justifications_path, params: { justification: justification_attributes }
        expect(response).to render_template :new
      end
    end
  end
end
