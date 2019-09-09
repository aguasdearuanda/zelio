require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  before do
    @admin = create(:admin)
  end

  describe 'Admin session' do
    context '#after_sign_in_path_for' do
      it 'redirects to admin dashboard if the user is admin' do
        sign_in @admin
        get admin_session_path
        expect(response).to redirect_to admin_dashboard_path
      end
    end

    context '#after_sign_out_path_for' do
      it 'redirects to admin dashboard if the user is admin' do
        sign_out @admin
        delete destroy_admin_session_path
        expect(response).to redirect_to new_admin_session_path
      end
    end
  end

  describe 'Student session' do
    before do
      @student = create(:student)
    end

    context '#after_sign_in_path_for' do
      it 'redirects to student dashboard if the user is student' do
        sign_in @student
        get student_session_path
        expect(response).to redirect_to student_dashboard_path
      end
    end

    context '#after_sign_out_path_for' do
      it 'redirects to sign_in page' do
        sign_out @student
        delete destroy_student_session_path
        expect(response).to redirect_to new_student_session_path
      end
    end
  end
end
