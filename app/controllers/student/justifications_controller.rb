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

    if @justification.save
      flash[:notice] = 'Justificativa enviada com sucesso!'
      redirect_to student_justification_path(@justification)
    else
      flash[:error] = 'Algo deu errado, tente novamente!'
      render :new
    end
  end

  private

  def justifications_params
    params.require(:justification).permit(:name, :date, :email, :description, :upload, :klass)
  end
end
