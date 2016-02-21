require 'rails_helper'

RSpec.describe Api::V1::CountryController, type: :controller do

  fixtures :all
  before(:each) do
    Country.delete_all
  end

  let(:valid_find_attributes) {
    {:letters => 'Countr'}
  }

  let(:invalid_find_attributes) {
    {:letters => ''}
  }


  let(:valid_create_attributes) {
    {:name => 'CountryTest'}
  }

  let(:invalid_create_attributes) {
    {:name => nil}
  }

  let(:valid_session) { {} }


  describe "GET #find_match" do
    it "find a match containing the letters informed at @countries", pamonha:true do
      country = Country.create! valid_create_attributes
      get :find_match, valid_find_attributes, valid_session
      expect(assigns(:countries)).to eq([country])
    end
  end


  describe "POST #create" do
    context "with valid params" do
      it "create a new country record for the specified name" do
        expect {
          post :create, valid_create_attributes, valid_session
        }.to change(Country, :count).by(1)
      end

      it "assings new country as @entity" do
        post :create, valid_create_attributes, valid_session
        expect(assigns(:entity)).to be_a(Country)
        expect(assigns(:entity)).to be_persisted
      end

      it "renders as create template" do
        post :create, valid_create_attributes, valid_session
        expect(response).to render_template("create")
      end

    end

    context "with invalid params" do
      it "should render error return" do
        post :create, invalid_create_attributes, valid_session
        expect(assigns(:err)).to be_a(Exception)
      end

      it "renders error template" do
        post :create, invalid_create_attributes, valid_session
        expect(response).to render_template("error")
      end
    end

  end



end
