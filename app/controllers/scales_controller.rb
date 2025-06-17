class ScalesController < ApplicationController
  before_action :set_scale, only: [ :show, :edit, :update, :destroy ]

  def index
    @scales = Scale.all
  end

  def show
  end

  def new
    @scale = Scale.new
  end

  def create
    @scale = Scale.new(scale_params)

    if @scale.save
      redirect_to @scale, notice: "Scale was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @scale.update(scale_params)
      redirect_to @scale, notice: "Scale was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @scale.destroy
    redirect_to scales_url, notice: "Scale was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions
    def set_scale
      @scale = Scale.find(params[:id])
    end

    # Only allow a list of trusted parameters through
    def scale_params
      params.require(:scale).permit(:name, :description, :value)
    end
end
