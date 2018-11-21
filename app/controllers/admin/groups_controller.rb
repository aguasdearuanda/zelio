# frozen_string_literal: true
class Admin::GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      flash[:success] = 'Group was created succesfully.'
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
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])

    if @group.destroy
      flash[:success] = 'The group was deleted succesfully.'
    else
      redirect_to admin_groups_path
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
