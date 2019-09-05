class Student::DashboardController < StudentController
  def index
    @student = current_user
    @justifications = Justification.all.where('status = ? AND email = ?', 'pendente', current_user.email)
    @total_justifications = Justification.all.where(email: current_user.email).count
  end
end
