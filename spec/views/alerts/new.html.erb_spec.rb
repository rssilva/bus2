require 'rails_helper'

RSpec.describe "alerts/new", type: :view do
  fixtures :all
  before(:each) do
    assign(:alert, Alert.new({:user => users(:one), :line => lines(:one), :position => '23132,1321313', :range => 6, :active => true}))
  end

  it "renders new alert form" do
    render

    assert_select "form[action=?][method=?]", alerts_path, "post" do
    end
  end
end
