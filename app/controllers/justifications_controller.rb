# frozen_string_literal: true

class JustificationsController < ApplicationController
  def new
    @justification = Justification.new
    @klasses = Klass.all
  end

  def create
    @justification = Justification.new(justifications_params)

    flash[:notice] = if verify_recaptcha(model: @justification) && @justification.save
                       'Justificativa enviada com sucesso!'
                     else
                       'Algo deu errado, por favor verifique os campos e o campo de segurança!'
                     end
    redirect_to new_justification_path
  end

  private

  def justifications_params
    params.require(:justification).permit(:name, :date, :email, :description, :upload, :klass)
  end
end
