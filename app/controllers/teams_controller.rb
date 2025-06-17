class TeamsController < ApplicationController
  before_action :set_team, only: [ :show, :edit, :update, :destroy ]

  def index
    @teams = Team.all
  end

  def show
    # @team is set by the before_action
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to @team, notice: "Team was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # @team is set by the before_action
  end

  def update
    if @team.update(team_params)
      redirect_to @team, notice: "Team was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @team.destroy
    redirect_to teams_path, notice: "Team was successfully deleted.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions
    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a list of trusted parameters through
    def team_params
      params.require(:team).permit(:name, :description, :is_active)
    end
end
