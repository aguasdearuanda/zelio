# frozen_string_literal: true

class JustificationsController < ApplicationController

  def new
    @justification = Justification.new
  end

  def create
    @justification = Justification.new(justifications_params)

    flash[:notice] = if @justification.save
                       'Justificativa enviada com sucesso!'
                     else
                       'Algo deu errado, tente novamente!'
                     end
    redirect_to new_justification_path
  end

  private

  def justifications_params
    params.require(:justification).permit(:name, :date, :email, :description, :upload)
  end
end
