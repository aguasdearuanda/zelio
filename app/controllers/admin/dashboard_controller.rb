# frozen_string_literal: true

class Admin::DashboardController < AdminController
  def index
    @klasses = Klass.all
    @students = active_students
    @attendances = Attendance.all
    @pending_justifications = Justification.all.where(status: 'pendente')
    @total_justifications = Justification.all.count
    @birthday = check_birthday_list
  end

  private

  def active_students
    count = 0
    Student.all.each do |s|
      count += 1 if s.situations.empty?
    end
    count
  end

  def check_birthday_list
    Student.where('extract(month from birthday) = ?', Date.today.month)
  end
end
