require 'rails_helper'

RSpec.describe Api::V1::CityController, type: :controller do

  fixtures :all
  before(:each) do
    Country.delete_all
    State.delete_all

    country = Country.find_or_create_by({:name => 'CountryTest'})
    @state = State.find_or_create_by({:name => 'StateTest', :country => country, :uf => 'ST'})
    # @city = City.find_or_create_by({:name => 'CityTest', :state => state})
  end

  let(:valid_find_attributes) {
    {:letters => 'Cit', :state_id => @state.id}
  }

  let(:invalid_find_attributes) {
    {:letters => '', :state_id => nil}
  }


  let(:valid_create_attributes) {
    {:name => 'CityTest', :state_id => @state.id}
  }

  let(:invalid_create_attributes) {
    {:name => nil, :state_id => nil}
  }

  let(:valid_session) { {} }


  describe "GET #find_match" do
    it "find a match containing the letters informed at @countries", pamonha:true do
      city = City.create! valid_create_attributes
      get :find_match, valid_find_attributes, valid_session
      expect(assigns(:cities)).to eq([city])
    end
  end


  describe "POST #create" do
    context "with valid params" do
      it "create a new country record for the specified name" do
        expect {
          post :create, valid_create_attributes, valid_session
        }.to change(City, :count).by(1)
      end

      it "assings new country as @entity" do
        post :create, valid_create_attributes, valid_session
        expect(assigns(:entity)).to be_a(City)
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
