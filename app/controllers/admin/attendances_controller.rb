# frozen_string_literal: true

class Admin::AttendancesController < AdminController
  layout 'internal'

  def index
    @klass = Klass.find_by(id: params[:klass_id])
    @attendances = @klass.attendances.order(realized_at: :desc)
  end

  def show
    @attendance = Attendance.find(params[:id])
  end

  def new
    @attendance = Attendance.new
    @klass = Klass.find_by(id: params[:klass_id])
  end

  def create
    @attendance = Attendance.new(attendance_params)

    if @attendance.save
      flash[:success] = 'Attendance was created succesfully.'
      redirect_to admin_klass_attendances_path
    else
      flash[:error] = 'Something went wrong.'
      render :new
    end
  end

  def edit
    @attendance = Attendance.find(params[:id])
    @klass = Klass.find_by(id: params[:klass_id])
  end

  def update
    @attendance = Attendance.find(params[:id])

    if @attendance.update(attendance_params)
      flash[:success] = 'The attendance was updated succesfully.'
      redirect_to admin_klass_attendances_path(@attendance.klasses.first.id)
    else
      render :edit
    end
  end

  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy

    flash['success'] = 'Attendance was removed successfully.'
    redirect_to admin_klass_attendances_path
  end

  private

  def attendance_params
    params.require(:attendance).permit(:name, :realized_at, klass_ids: [], student_ids: [])
  end
end
