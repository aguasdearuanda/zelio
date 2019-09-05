# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_namespace_scope!
  helper_method :after_sign_in_path_for,
                :after_sign_out_path_for,
                :current_user,
                :user_context,
                :user_prefix

  def current_user
    send "current_#{user_context}" if user_context.present?
  end

  def user_context
    case user_prefix
    when 'a'
      'admin'
    when 's'
      'student'
    end
  end

  def user_prefix
    slices = request.path.split('/')
    return unless slices.size > 1
    slices.second
  end

  private

  def after_sign_in_path_for(resource)
    if resource.is_a? Admin
      admin_dashboard_path
    elsif resource.is_a? Student
      student_dashboard_path
    else
      super(resource)
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :admin
      new_admin_session_path
    elsif resource == :student
      new_student_session_path
    else
      super(resource)
    end
  end

  def authenticate_namespace_scope!
    case user_context
    when 'a'
      authenticate_admin!
    when 's'
      authenticate_student!
    end
  end
end
