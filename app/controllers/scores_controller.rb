class ScoresController < ApplicationController
  before_action :set_score, only: [ :show, :edit, :update, :destroy ]

  def index
    @scores = Score.includes(:team, :scale, :action_item)
                   .order(created_at: :desc)
                   .paginate(page: params[:page], per_page: 20)
  end

  def show
    @comments = @score.comments.includes(:user).order(created_at: :desc)
  end

  def new
    @score = Score.new
    @teams = Team.where(is_active: true)
    @scales = Scale.all
    @action_items = ActionItem.where(is_active: true)
  end

  def create
    @score = Score.new(score_params)

    if @score.save
      redirect_to @score, notice: "Score was successfully created."
    else
      @teams = Team.where(is_active: true)
      @scales = Scale.all
      @action_items = ActionItem.where(is_active: true)
      render :new
    end
  end

  def edit
    @teams = Team.where(is_active: true)
    @scales = Scale.all
    @action_items = ActionItem.where(is_active: true)
  end

  def update
    if @score.update(score_params)
      redirect_to @score, notice: "Score was successfully updated."
    else
      @teams = Team.where(is_active: true)
      @scales = Scale.all
      @action_items = ActionItem.where(is_active: true)
      render :edit
    end
  end

  def destroy
    @score.destroy
    redirect_to scores_path, notice: "Score was successfully deleted."
  end

  private

  def set_score
    @score = Score.find(params[:id])
  end

  def score_params
    params.require(:score).permit(:scale_id, :team_id, :action_item_id)
  end
end
