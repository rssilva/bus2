class PathsController < ApplicationController
  include RestApiConcerns
  before_action :authenticate, if: "Rails.env.production? || Rails.env.development?"
  before_action :set_path, only: [:show, :edit, :update, :destroy]

  # GET /paths
  # GET /paths.json
  def index
    limit = params[:limit]||10
    offset = params[:offset]||0
    paths = Path.limit(limit).offset(offset)
    render json: paths, status: :ok
  end

  # GET /paths/1
  # GET /paths/1.json
  def show
    render json: @path,  status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_path
      @path = Path.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def path_params
      params.require(:path).permit(:line_id, :data)
    end
end
