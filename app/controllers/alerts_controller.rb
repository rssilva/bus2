class AlertsController < ApplicationController
  include RestApiConcerns

  before_action :authenticate, if: "Rails.env.production? || Rails.env.development?"

  before_action :set_alert, only: [:show, :edit, :update, :destroy]

  # GET /alerts
  # GET /alerts.json
  def index
    limit = params[:limit]||10
    offset = params[:offset]||0
    alerts = Alert.where({:user_id => current_user.id}).limit(limit).offset(offset)
    render json: alerts, status: :ok
  end

  # GET /lines/1
  # GET /lines/1.json
  def show
    render json: @alert,  status: :ok
  end

  # POST /alerts
  # POST /alerts.json
  def create
    @alert = Alert.new(alert_params.merge({:user_id => current_user.id}))

      if @alert.save
        render json: @alert, status: :created
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
      params.require(:alert).permit(:line_id, :position, :range, :active)
    end
end
