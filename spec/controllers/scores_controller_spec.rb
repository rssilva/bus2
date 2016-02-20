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

RSpec.describe ScoresController, type: :controller do
  fixtures :all

  # This should return the minimal set of attributes required to create a valid
  # Score. As you add validations to Score, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {:user_id => users(:one).id}
  }

  let(:invalid_attributes) {
    {:user_id => ''}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ScoresController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all scores as @scores" do
      score = Score.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:scores)).to eq([score])
    end
  end

  describe "GET #show" do
    it "assigns the requested score as @score" do
      score = Score.create! valid_attributes
      get :show, {:id => score.to_param}, valid_session
      expect(assigns(:score)).to eq(score)
    end
  end

  describe "GET #new" do
    it "assigns a new score as @score" do
      get :new, {}, valid_session
      expect(assigns(:score)).to be_a_new(Score)
    end
  end

  describe "GET #edit" do
    it "assigns the requested score as @score" do
      score = Score.create! valid_attributes
      get :edit, {:id => score.to_param}, valid_session
      expect(assigns(:score)).to eq(score)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Score" do
        expect {
          post :create, {:score => valid_attributes}, valid_session
        }.to change(Score, :count).by(1)
      end

      it "assigns a newly created score as @score" do
        post :create, {:score => valid_attributes}, valid_session
        expect(assigns(:score)).to be_a(Score)
        expect(assigns(:score)).to be_persisted
      end

      it "redirects to the created score" do
        post :create, {:score => valid_attributes}, valid_session
        expect(response).to redirect_to(Score.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved score as @score" do
        post :create, {:score => invalid_attributes}, valid_session
        expect(assigns(:score)).to be_a_new(Score)
      end

      it "re-renders the 'new' template" do
        post :create, {:score => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested score" do
      score = Score.create! valid_attributes
      expect {
        delete :destroy, {:id => score.to_param}, valid_session
      }.to change(Score, :count).by(-1)
    end

    it "redirects to the scores list" do
      score = Score.create! valid_attributes
      delete :destroy, {:id => score.to_param}, valid_session
      expect(response).to redirect_to(scores_url)
    end
  end

end
