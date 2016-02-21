require 'rails_helper'

RSpec.describe "Alerts", type: :request do
  fixtures :all
  describe "GET /alerts" do
    it "works! (now write some real specs)" do

      AlertsController.any_instance.stubs(:current_user).returns(User.new(id: users(:one).id))

      get alerts_path

      expect(response).to have_http_status(200)
    end
  end
end
