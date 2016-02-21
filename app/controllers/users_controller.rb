class UsersController < ApplicationController

  include RestApiConcerns

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    render json: @user, :except => [:password_digest, :facebook_id],  status: :ok
  end

  def facebook
    unless params[:user][:fb_token]
      render json: Exception.new('Invalid token'), status: :unprocessable_entity
    end
      @fb_params = Facebook.authenticate(params[:user][:fb_token])
      user = User.find_by_facebook_id(@fb_params[:facebook_id])
      if user
        render json: {:id => user[:id], :name => user[:name], :email => user[:email]}, status: :ok
      else
        self.create unless User.find_by_facebook_id(@fb_params[:facebook_id])
      end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(@fb_params||user_params)

      if @user.save
        render json: @user, :except => [:password_digest, :facebook_id], status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
      if @user.update(user_params)
        render json: @user, :except => [:password_digest, :facebook_id], status: :ok
      else
        render json: @user.errors, status: :unprocessable_entity
      end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
       head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :fb_token)
    end
end
