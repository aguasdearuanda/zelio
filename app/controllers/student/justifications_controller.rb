# frozen_string_literal: true

class Student::JustificationsController < StudentController
  def index
    @justifications = Justification.all.where(email: current_user.email)
  end

  def show
    @justification = Justification.find(params[:id])
  end
end
