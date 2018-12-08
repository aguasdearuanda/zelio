# frozen_string_literal: true

class Admin::StudentsController < ApplicationController
  layout 'internal'

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.save
      flash[:success] = 'Aluno criado com sucesso!'
      redirect_to admin_students_path
    else
      render :edit
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      flash[:success] = 'Aluno atualizado com sucesso!'
      redirect_to admin_students_path
    else
      render :edit
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    flash[:success] = 'Aluno removido com sucesso.'
    redirect_to admin_students_path
  end

  private

  def student_params
    params.require(:student).permit(:name, :birthday, :email, :phone, klass_ids: [])
  end
end
