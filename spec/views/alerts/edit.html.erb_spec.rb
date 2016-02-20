require 'rails_helper'

RSpec.describe "alerts/edit", type: :view do
  fixtures :all
  before(:each) do
    @alert = assign(:alert, Alert.create!({:user => users(:one), :line => lines(:one), :position => '23132,1321313', :range => 6, :active => true}))
  end

  it "renders the edit alert form" do
    render

    assert_select "form[action=?][method=?]", alert_path(@alert), "post" do
    end
  end
end
