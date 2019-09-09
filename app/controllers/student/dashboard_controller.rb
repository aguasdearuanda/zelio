class Student::DashboardController < StudentController
  def index
    @student = current_user
    @justifications = Justification.pending_justifications(@student)
    @total_justifications = Justification.total_justifications(@student)
  end
end
