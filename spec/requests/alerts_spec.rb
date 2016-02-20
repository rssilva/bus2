require 'rails_helper'

RSpec.describe "Alerts", type: :request do
  describe "GET /alerts" do
    it "works! (now write some real specs)" do
      get alerts_path
      expect(response).to have_http_status(200)
    end
  end
end
