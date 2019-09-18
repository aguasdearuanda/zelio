# frozen_string_literal: true

class Admin::JustificationsController < AdminController
  def index
    @justifications = Justification.all
  end

  def show
    @justification = Justification.find(params[:id])
  end

  def edit
    @justification = Justification.find(params[:id])
    render :edit
  end

  def update
    @justification = Justification.find(params[:id])
    if @justification.update(justification_params)
      flash[:notice] = 'Justificativa atualizada com sucesso!'
      redirect_to admin_justifications_path
    else
      flash[:notice] = 'Algo errado aconteceu, tente novamente!'
      redirect_to admin_justification_path(@justification)
    end
  end

  def destroy
    @justification = Justification.find(params[:id])
    @justification.destroy

    flash['success'] = 'Attendance was removed successfully.'
    redirect_to admin_justifications_path
  end

  private

  def justification_params
    params.require(:justification).permit(:status)
  end
end
