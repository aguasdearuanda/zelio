class RegistrationsController < Devise::RegistrationsController
  layout 'internal'

  protected

  def after_update_path_for(resource)
    case resource
    when Admin
      admin_dashboard_path
    when Student
      student_dashboard_path
    end
  end
end
