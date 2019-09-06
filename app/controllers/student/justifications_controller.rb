# frozen_string_literal: true

class Student::JustificationsController < StudentController
  def index
    @justifications = Justification.all.where(email: current_user.email)
  end

  def show
    @justification = Justification.find(params[:id])
  end

  def new
    @justification = Justification.new
    @klasses = Klass.all
  end

  def create
    @justification = Justification.new(justifications_params)

    flash[:notice] = if @justification.save
                       'Justificativa enviada com sucesso!'
                     else
                       'Algo deu errado, tente novamente!'
                     end
    redirect_to student_justifications_path
  end

  private

  def justifications_params
    params.require(:justification).permit(:name, :date, :email, :description, :upload, :klass)
  end
end
