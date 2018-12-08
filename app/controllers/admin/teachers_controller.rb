# frozen_string_literal: true

class Admin::TeachersController < ApplicationController
  layout 'internal'

  def index
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      flash[:success] = 'Professor(a) criado com sucesso!'
      redirect_to admin_teachers_path
    else
      render :edit
    end
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])

    if @teacher.update(teacher_params)
      flash[:success] = 'Professor(a) atualizado com sucesso!'
      redirect_to admin_teachers_path
    else
      render :edit
    end
  end

  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy
    flash[:success] = 'Professor(a) removido com sucesso.'
    redirect_to admin_teachers_path
  end

  private

  def teacher_params
    params.require(:teacher).permit(:name, :birthday, :email, :phone, klass_ids: [])
  end
end
