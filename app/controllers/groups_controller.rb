class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: %i[show update destroy]

  def index
    @groups = current_user.groups.includes(:movements)
  end

  def show
    @group = Group.find(params[:id])
    @movements = @group.movements.order(created_at: :desc)
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save
      redirect_to groups_path, notice: 'Category added successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_path, notice: 'Category removed successfully'
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
