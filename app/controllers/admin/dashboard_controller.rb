# frozen_string_literal: true

class Admin::DashboardController < AdminController
  def index
    @klasses = Klass.all
    @students = Student.all
    @attendances = Attendance.all
  end
end
