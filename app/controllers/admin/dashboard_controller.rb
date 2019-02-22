# frozen_string_literal: true

class Admin::DashboardController < AdminController
  def index
    @klasses = Klass.all
    @students = Student.all
    @attendances = Attendance.all
    @justifications = Justification.all.where(status: 'pendente')
    @birthday = birthday_list
  end

  def birthday_list
    Student.where('extract(month from birthday) = ?', Date.today.month)
  end
end
