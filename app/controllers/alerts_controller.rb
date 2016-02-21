class AlertsController < ApplicationController
  include RestApiConcerns

  before_action :set_alert, only: [:show, :edit, :update, :destroy]

  # GET /alerts
  # GET /alerts.json
  def index
    @alerts = Alert.all
  end

  # GET /lines/1
  # GET /lines/1.json
  def show
    render json: @alert,  status: :ok
  end

  # POST /alerts
  # POST /alerts.json
  def create
    @alert = Alert.new(alert_params)

      if @alert.save
        render json: @alert, status: :created
      else
        render json: @alert.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /alerts/1
  # PATCH/PUT /alerts/1.json
  def update
      if @alert.update(alert_params)
        render json: @alert, status: :ok
      else
        render json: @alert.errors, status: :unprocessable_entity
      end
  end

  # DELETE /alerts/1
  # DELETE /alerts/1.json
  def destroy
    @alert.destroy
       head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alert
      @alert = Alert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alert_params
      params.require(:alert).permit(:user_id, :line_id, :position, :range, :active)
    end
end
