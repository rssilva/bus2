class ScoresController < ApplicationController
  include RestApiConcerns
  before_action :authenticate, if: "Rails.env.production? || Rails.env.development?"
  before_action :set_score, only: [:show, :edit, :update, :destroy]

  # GET /scores
  # GET /scores.json
  def index
    limit = params[:limit]||10
    offset = params[:offset]||0
    scores = Score.limit(limit).offset(offset)
    render json: scores, status: :ok
  end

  # GET /scores/1
  # GET /scores/1.json
  def show
    render json: @score,  status: :ok
  end

  # POST /scores
  # POST /scores.json
  def create
    @score = Score.find_by_user_id(score_params[:user_id])
    @score = Score.new(score_params) unless @score

    if @score.save
      render json: @score, status: :created
    else
      render json: @score.errors, status: :unprocessable_entity
    end
  end

  # DELETE /scores/1
  # DELETE /scores/1.json
  def destroy
    @score.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_score
      @score = Score.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def score_params
      params.require(:score).permit(:user_id)
    end
end
