require 'rails_helper'

RSpec.describe "alerts/index", type: :view do
  fixtures :all
  before(:each) do
    assign(:alerts, [
      Alert.create!({:user => users(:one), :line => lines(:one), :position => '23132,1321313', :range => 6, :active => true}),
      Alert.create!({:user => users(:two), :line => lines(:one), :position => '23132,1321313', :range => 6, :active => true})
    ])
  end

  it "renders a list of alerts" do
    render
  end
end
