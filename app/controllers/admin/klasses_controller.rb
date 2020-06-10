# frozen_string_literal: true

class Admin::KlassesController < AdminController
  layout 'internal'
  before_action :set_klass, except: %i[index new create]

  def index
    @klasses = Klass.all
  end

  def show
    @attendances = @klass.attendances.all
  end

  def new
    @klass = Klass.new
  end

  def create
    @klass = Klass.new(klass_params)

    if @klass.save
      flash[:notice] = 'Turma criada com sucesso!'
      redirect_to admin_klasses_path
    else
      flash[:alert] = 'Algo deu errado, verifique se você não esqueceu de preencher algo!'
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    if @klass.update(klass_params)
      flash[:notice] = 'A turma foi atualizada com sucesso!'
      redirect_to admin_klasses_path
    else
      render :edit
    end
  end

  def disable_student
    @klass.disable_student(params[:student_id])
    redirect_to admin_klasses_path
  end

  def disable
    @klass.disable
    flash[:notice] = 'A turma foi desativada com sucesso!'
    redirect_to admin_klasses_path
  end

  def absences
    @student = @klass.students.find(params[:student_id])
    @attendances = @klass.attendances.all
    @details = student_details

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @klass.destroy

    flash[:notice] = 'Turma excluída com sucesso!'
    redirect_to admin_klasses_path
  end

  private

  def klass_params
    params.require(:klass).permit(:name, teacher_ids: [], student_ids: [])
  end

  def set_klass
    @klass = Klass.find(params[:klass_id] || params[:id])
  end

  def student_details
    {
      klasses: @student.show_attendances(@attendances, @klass.id),
      absences: @student.count_presence(@attendances, @klass.id),
      justifications: @student.check_justifications(@klass.id, @student.email)
    }
  end
end
