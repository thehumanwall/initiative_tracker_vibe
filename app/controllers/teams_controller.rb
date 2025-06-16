class TeamsController < ApplicationController
  before_action :set_team, only: [ :show, :edit, :update, :destroy ]

  # GET /teams
  def index
    @teams = Team.all
  end

  # GET /teams/:id
  def show
    # @team is set by the before_action
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/:id/edit
  def edit
    # @team is set by the before_action
  end

  # POST /teams
  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to @team, notice: "Team was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teams/:id
  def update
    if @team.update(team_params)
      redirect_to @team, notice: "Team was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /teams/:id
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
