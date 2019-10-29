# frozen_string_literal: true

class Student::JustificationsController < StudentController
  def index
    @justifications = current_user.justifications
  end

  def show
    @justification = Justification.find(params[:id])
  end

  def new
    @justification = Justification.new
    @klasses = current_user.klasses
  end

  def create
    @justification = Justification.new(justifications_params)

    if verify_recaptcha(model: @justification) && @justification.save
      flash[:notice] = 'Justificativa enviada com sucesso!'
      redirect_to student_justification_path(@justification)
    else
      flash[:error] = 'Algo deu errado, por favor verifique os campos e o campo de segurança!'
      render :new
    end
  end

  private

  def justifications_params
    params.require(:justification).permit(:name, :date, :email, :description, :upload, :klass)
  end
end
