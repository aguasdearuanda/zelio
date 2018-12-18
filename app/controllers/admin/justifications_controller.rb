# frozen_string_literal: true

class Admin::JustificationsController < AdminController
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
      redirect_to admin_dashboard_path
    else
      flash[:notice] = 'Algo errado aconteceu, tente novamente!'
      redirect_to admin_justification_path(@justification)
    end
  end

  private

  def justification_params
    params.require(:justification).permit(:status)
  end
end
