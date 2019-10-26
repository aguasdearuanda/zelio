require 'rails_helper'

RSpec.describe 'Registrations', type: :request do
  describe 'Student registration' do
    let(:student) { create(:student) }

    setup do
      sign_in student
      @params = { params: { student: { password: 'test123',
                                       password_confirmation: 'test123',
                                       current_password: 'zeliotest' } } }
    end

    it 'checks if the password was updated' do
      put student_registration_path, @params
      student.reload
      expect(student.valid_password?('test123')).to be(true)
    end

    context '#after_update_path_for' do
      it 'redirects to the current user dashboard' do
        put student_registration_path, @params
        expect(response).to redirect_to student_dashboard_path
      end
    end

    context 'when edit password fail' do
      it 'redirects to edit template' do
        put student_registration_path, params: { student: { passsword: '2323',
                                                            password_confirmation: '2222',
                                                            current_password: 'saddsdsa',
                                                            email: 'x@x.com' } }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'Admin registration' do
    let(:admin) { create(:admin) }

    setup do
      sign_in admin
      @params = { params: { admin: { password: 'admin123',
                                     password_confirmation: 'admin123',
                                     current_password: '1234567890' } } }
    end

    it 'checks if the password was updated' do
      put admin_registration_path, @params
      admin.reload
      expect(admin.valid_password?('admin123')).to be(true)
    end

    context '#after_update_path_for' do
      it 'redirects to the current user dashboard' do
        put admin_registration_path, @params
        expect(response).to redirect_to admin_dashboard_path
      end
    end

    context 'when edit password fail' do
      it 'redirects to edit template' do
        put admin_registration_path, params: { admin: { passsword: '2323',
                                                        password_confirmation: '2222',
                                                        current_password: 'saddsdsa',
                                                        email: 'x@x.com' } }
        expect(response).to render_template :edit
      end
    end
  end
end
