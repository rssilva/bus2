class PathsController < ApplicationController
  include RestApiConcerns
  before_action :set_path, only: [:show, :edit, :update, :destroy]

  # GET /paths
  # GET /paths.json
  def index
    @paths = Path.all
  end

  # GET /paths/1
  # GET /paths/1.json
  def show
  end

  # POST /paths
  # POST /paths.json
  def create
    @path = Path.new(path_params)
      if @path.save
         render :show, status: :created, location: @path
      else
        render json: @path.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /paths/1
  # PATCH/PUT /paths/1.json
  def update
    p path_params
      if @path.update(path_params)
        p @path
         render json: @path, status: :ok
      else
         render json: @path.errors, status: :unprocessable_entity
      end
  end

  # DELETE /paths/1
  # DELETE /paths/1.json
  def destroy
    @path.destroy
       head :no_content
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
