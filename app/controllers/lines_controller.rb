class LinesController < ApplicationController
  include RestApiConcerns
  before_action :set_line, only: [:show, :edit, :update, :destroy]

  # GET /lines
  # GET /lines.json
  def index
    limit = params[:limit]||10
    offset = params[:offset]||0
    lines = Line.limit(limit).offset(offset)
    render json: lines, status: :ok
  end

  # GET /lines/1
  # GET /lines/1.json
  def show
    render json: @line,  status: :ok
  end

  # POST /lines
  # POST /lines.json
  def create
    @line = Line.new(line_params)

      if @line.save
        render json: @line, status: :created
      else
        render json: @line.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /lines/1
  # PATCH/PUT /lines/1.json
  def update
      if @line.update(line_params)
        render json: @line, status: :ok
      else
        render json: @line.errors, status: :unprocessable_entity
      end
  end

  # DELETE /lines/1
  # DELETE /lines/1.json
  def destroy
    @line.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line
      @line = Line.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_params
      params.require(:line).permit(:name, :city_id)
    end
end
