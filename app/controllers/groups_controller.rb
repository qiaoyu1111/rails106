class GroupsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :upvote, :devote]

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
      redirect_to groups_path
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path, alert: "Group Deleted ."
  end

  def upvote
    @group = Group.find(params[:id])
    @group.votes.create
    redirect_to groups_path, notice: "感谢支持 ！"
  end

  def devote
    @group = Group.find(params[:id])
    @group.votes.first.destroy if @group.votes.count > 0
    redirect_to groups_path, alert: "真的这么残忍吗 ？！"
  end

  def create
  @group = Group.new(group_params)

  if @group.save
    redirect_to groups_path
  else
    render :new
  end
end

  private

  def group_params
    params.require(:group).permit(:title, :description)
  end
end
