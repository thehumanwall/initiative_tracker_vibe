class ActionItemsController < ApplicationController
  before_action :set_action_item, only: [ :show, :edit, :update, :destroy ]

  def index
    @action_items = ActionItem.all
  end

  def show
    # @action_item is set by the before_action
  end

  def new
    @action_item = ActionItem.new
  end

  def create
    @action_item = ActionItem.new(action_item_params)

    if @action_item.save
      redirect_to @action_item, notice: "Action item was successfully created."
    else
      render :new
    end
  end

  def edit
    # @action_item is set by the before_action
  end

  def update
    if @action_item.update(action_item_params)
      redirect_to @action_item, notice: "Action item was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @action_item.destroy
    redirect_to action_items_path, notice: "Action item was successfully destroyed."
  end

  private

  def set_action_item
    @action_item = ActionItem.find(params[:id])
  end

  def action_item_params
    params.require(:action_item).permit(:name, :metric_id, :is_active)
  end
end
