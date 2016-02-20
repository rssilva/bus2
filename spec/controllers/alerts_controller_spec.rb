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

RSpec.describe AlertsController, type: :controller do
  fixtures :all
  # This should return the minimal set of attributes required to create a valid
  # Alert. As you add validations to Alert, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {:user_id => users(:one).id, :line_id => lines(:one).id, :position => '65765,-2424', :range => 2, :active => true}
  }

  let(:invalid_attributes) {
    {:user => nil, :line => lines(:one), :position => '', :range => 2, :active => true}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AlertsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all alerts as @alerts" do
      Alert.destroy_all
      alert = Alert.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:alerts)).to eq([alert])
    end
  end

  describe "GET #show" do
    it "assigns the requested alert as @alert" do
      Alert.destroy_all
      alert = Alert.create! valid_attributes
      get :show, {:id => alert.to_param}, valid_session
      expect(assigns(:alert)).to eq(alert)
    end
  end

  describe "GET #new" do
    it "assigns a new alert as @alert" do
      get :new, {}, valid_session
      expect(assigns(:alert)).to be_a_new(Alert)
    end
  end

  describe "GET #edit" do
    it "assigns the requested alert as @alert" do
      Alert.destroy_all
      alert = Alert.create! valid_attributes
      get :edit, {:id => alert.to_param}, valid_session
      expect(assigns(:alert)).to eq(alert)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      before :each do
        Alert.destroy_all
      end
      it "creates a new Alert" do
        expect {
          post :create, {:alert => valid_attributes}, valid_session
        }.to change(Alert, :count).by(1)
      end

      it "assigns a newly created alert as @alert" do
        post :create, {:alert => valid_attributes}, valid_session
        expect(assigns(:alert)).to be_a(Alert)
        expect(assigns(:alert)).to be_persisted
      end

      it "redirects to the created alert" do
        post :create, {:alert => valid_attributes}, valid_session
        expect(response).to redirect_to(Alert.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved alert as @alert" do
        post :create, {:alert => invalid_attributes}, valid_session
        expect(assigns(:alert)).to be_a_new(Alert)
      end

      it "re-renders the 'new' template" do
        post :create, {:alert => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    before :each do
      Alert.destroy_all
    end
    context "with valid params" do
      let(:new_attributes) {
        {:range => 2, :position => '31323,678687'}
      }

      it "updates the requested alert" do
        alert = Alert.create! valid_attributes
        put :update, {:id => alert.to_param, :alert => new_attributes}, valid_session
        alert.reload
        expect(alert.range).to eq(new_attributes[:range])
        expect(alert.position).to eq(new_attributes[:position])
      end

      it "assigns the requested alert as @alert" do
        alert = Alert.create! valid_attributes
        put :update, {:id => alert.to_param, :alert => valid_attributes}, valid_session
        expect(assigns(:alert)).to eq(alert)
      end

      it "redirects to the alert" do
        alert = Alert.create! valid_attributes
        put :update, {:id => alert.to_param, :alert => valid_attributes}, valid_session
        expect(response).to redirect_to(alert)
      end
    end

    context "with invalid params" do
      it "assigns the alert as @alert" do
        alert = Alert.create! valid_attributes
        put :update, {:id => alert.to_param, :alert => invalid_attributes}, valid_session
        expect(assigns(:alert)).to eq(alert)
      end

      it "re-renders the 'edit' template" do
        alert = Alert.create! valid_attributes
        put :update, {:id => alert.to_param, :alert => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      Alert.destroy_all
    end
    it "destroys the requested alert" do
      alert = Alert.create! valid_attributes
      expect {
        delete :destroy, {:id => alert.to_param}, valid_session
      }.to change(Alert, :count).by(-1)
    end

    it "redirects to the alerts list" do
      alert = Alert.create! valid_attributes
      delete :destroy, {:id => alert.to_param}, valid_session
      expect(response).to redirect_to(alerts_url)
    end
  end

end