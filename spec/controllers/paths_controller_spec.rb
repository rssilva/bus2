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

RSpec.describe PathsController, type: :controller do


  fixtures :all
  # This should return the minimal set of attributes required to create a valid
  # Path. As you add validations to Path, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {:line_id => lines(:three).id, :data => '{}'}
  }

  let(:invalid_attributes) {
    {:line_id => ''}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PathsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all paths as @paths" do
      Path.destroy_all
      path = Path.create! valid_attributes
      get :index, {}, valid_session
      expect(response.body).to eq(Path.all.to_json)
    end
  end

  describe "GET #show" do
    it "assigns the requested path as @path" do
      path = Path.create! valid_attributes
      get :show, {:id => path.to_param}, valid_session
      expect(assigns(:path)).to eq(path)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      before :each do
        Path.destroy_all
      end
      it "creates a new Path" do
        expect {
          post :create, {:path => valid_attributes}, valid_session
        }.to change(Path, :count).by(1)
      end

      it "assigns a newly created path as @path" do
        post :create, {:path => valid_attributes}, valid_session
        expect(assigns(:path)).to be_a(Path)
        expect(assigns(:path)).to be_persisted
      end

      it "returns created code" do
        post :create, {:path => valid_attributes}, valid_session
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved path as @path" do
        post :create, {:path => invalid_attributes}, valid_session
        expect(assigns(:path)).to be_a_new(Path)
      end

      it "returns unprocessable_entity code" do
        post :create, {:path => invalid_attributes}, valid_session
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {:data => 'lalala'}
      }
      before :each do
        Path.destroy_all
      end
      it "updates the requested path" do
        path = Path.create! valid_attributes
        put :update, {:id => path.to_param, :path => new_attributes}, valid_session
        path.reload
        expect(path.data).to eq('lalala')
      end

      it "assigns the requested path as @path" do
        path = Path.create! valid_attributes
        put :update, {:id => path.to_param, :path => valid_attributes}, valid_session
        expect(assigns(:path)).to eq(path)
      end

      it "returns ok code" do
        path = Path.create! valid_attributes
        put :update, {:id => path.to_param, :path => valid_attributes}, valid_session
        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid params" do
      before :each do
        Path.destroy_all
      end
      it "should not update params" do
        path = Path.create! valid_attributes
        put :update, {:id => path.to_param, :path => invalid_attributes}, valid_session
        expect(Path.last.to_json).to eq(path.to_json)
      end

      it "returns unprocessable_entity code" do
        path = Path.create! valid_attributes
        put :update, {:id => path.to_param, :path => invalid_attributes}, valid_session
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      Path.destroy_all
    end
    it "destroys the requested path" do
      path = Path.create! valid_attributes
      expect {
        delete :destroy, {:id => path.to_param}, valid_session
      }.to change(Path, :count).by(-1)
    end

    it "returns no_content code" do
      path = Path.create! valid_attributes
      delete :destroy, {:id => path.to_param}, valid_session
      expect(response).to have_http_status(:no_content)
    end
  end

end
