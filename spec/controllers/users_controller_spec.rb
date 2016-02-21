require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe UsersController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {:name => 'John',:email => 'john@doe.com', :password => 'test', :password_confirmation => 'test'}
  }

  let(:invalid_attributes) {
    {:name => '', :email => 'joão'}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all users as @users", lata:true do
      User.destroy_all
      user = User.create! valid_attributes
      get :index, {}, valid_session

      users = JSON.parse(User.all.to_json)
      users[0].delete("password_digest")
      users[0].delete("facebook_id")
      expect(JSON.parse(response.body)).to eq(users)
    end
  end

  describe "GET #show" do
    it "assigns the requested user as @user" do
      User.destroy_all
      user = User.create! valid_attributes
      get :show, {:id => user.to_param}, valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "GET #edit" do
    it "assigns the requested user as @user" do
      User.destroy_all
      user = User.create! valid_attributes
      get :edit, {:id => user.to_param}, valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe "POST #create" do
    before :each do
      User.destroy_all
    end
    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, {:user => valid_attributes}, valid_session
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, {:user => valid_attributes}, valid_session
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it "returns status created" do
        post :create, {:user => valid_attributes}, valid_session
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        post :create, {:user => invalid_attributes}, valid_session
        expect(assigns(:user)).to be_a_new(User)
      end

      it "returns status unprocessable_entity" do
        post :create, {:user => invalid_attributes}, valid_session
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT #update" do
    before :each do
      User.destroy_all
    end
    context "with valid params" do
      let(:new_attributes) {
        {:password => 'new_pass', :password_confirmation => 'new_pass'}
      }

      it "updates the requested user", focus:true do
        user = User.create! valid_attributes
        put :update, {:id => user.to_param, :user => new_attributes}, valid_session
        user.reload
        expect(user.authenticate('new_pass')).not_to be(false)
      end

      it "assigns the requested user as @user" do
        user = User.create! valid_attributes
        put :update, {:id => user.to_param, :user => valid_attributes}, valid_session
        expect(assigns(:user)).to eq(user)
      end

      it "returns code ok" do
        user = User.create! valid_attributes
        put :update, {:id => user.to_param, :user => valid_attributes}, valid_session
        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid params" do
      it "assigns the user as @user" do
        user = User.create! valid_attributes
        put :update, {:id => user.to_param, :user => invalid_attributes}, valid_session
        expect(assigns(:user)).to eq(user)
      end

      it "returns unprocessable_entity code" do
        user = User.create! valid_attributes
        put :update, {:id => user.to_param, :user => invalid_attributes}, valid_session
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
