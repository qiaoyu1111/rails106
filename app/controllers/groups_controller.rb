class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.new(group_params)
    if @group.edit
      redirect_to groups_path, notice: "Update Success !"
    else
      render :new
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path, alert: "Group Deleted ."
  end

  private

  def group_params
    params.require(:group).permit(:title, :description)
  end
end
