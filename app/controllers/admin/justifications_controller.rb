# frozen_string_literal: true

class Admin::JustificationsController < AdminController
  before_action :set_justification, except: %i[index]

  def index
    @justifications = Justification.all
  end

  def edit
    render :edit
  end

  def update
    if @justification.update(justification_params)
      flash[:notice] = 'Justificativa atualizada com sucesso!'
      redirect_to admin_justifications_path
    else
      flash[:notice] = 'Algo errado aconteceu, tente novamente!'
      render :edit
    end
  end

  def destroy
    @justification.destroy

    flash[:notice] = 'Justificativa apagada com sucesso.'
    redirect_to admin_justifications_path
  end

  private

  def justification_params
    params.require(:justification).permit(:status)
  end

  def set_justification
    @justification = Justification.find(params[:id])
  end
end
