class MovementsController < ApplicationController
  before_action :set_group
  before_action :set_movement, only: %i[show update destroy]

  def index
    @movements = @group.movements.order(created_at: :desc)
    @total_amount = @movements.sum(:amount)
  end

  def new
    @movement = Movement.new
  end

  def create
    @movement = Movement.new(movement_params)
    @movement.group = @group
    @movement.user = current_user
    @movement.author = current_user

    if @movement.save
      redirect_to group_movements_path(@group), notice: 'Movement added successfully'
    else
      render :new, alert: 'Failed to add movement'
    end
  end

  def destroy
    if @movement.destroy
      redirect_to group_movements_path(@group), notice: 'Movement removed successfully'
    else
      render :index, alert: 'Failed to remove movement'
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_movement
    @movement = Movement.find(params[:id])
  end

  def movement_params
    params.require(:movement).permit(:name, :amount)
  end
end
