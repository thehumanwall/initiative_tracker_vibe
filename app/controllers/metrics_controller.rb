class MetricsController < ApplicationController
  before_action :set_metric, only: [ :show, :edit, :update, :destroy ]

  def new
    @metric = Metric.new
  end

  def create
    @metric = Metric.new(metric_params)

    if @metric.save
      redirect_to @metric, notice: "Metric was successfully created."
    else
      render :new
    end
  end

  def show
  end

  def index
    @metrics = Metric.all
  end

  def edit
  end

  def update
    if @metric.update(metric_params)
      redirect_to @metric, notice: "Metric was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @metric.destroy
    redirect_to metrics_url, notice: "Metric was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions
    def set_metric
      @metric = Metric.find(params[:id])
    end

    # Only allow a list of trusted parameters through
    def metric_params
      params.require(:metric).permit(:name, :is_active)
    end
end
