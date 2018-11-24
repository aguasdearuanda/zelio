# frozen_string_literal: true

class Admin::GroupsController < ApplicationController
  layout 'internal'

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      flash[:success] = 'Group was created succesfully.'
      redirect_to admin_groups_path
    else
      flash[:error] = 'Something went wrong.'
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
    render :edit
  end

  def update
    @group = Group.find(params[:id])

    if @group.update_attributes(group_params)
      flash[:success] = 'The group was updated succesfully.'
      redirect_to admin_groups_path
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    flash['success'] = 'Group was removed successfully.'
    redirect_to admin_groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
