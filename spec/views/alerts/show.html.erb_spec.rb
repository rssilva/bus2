require 'rails_helper'

RSpec.describe "alerts/show", type: :view do
  fixtures :all
  before(:each) do
    @alert = assign(:alert, Alert.create!({:user => users(:one), :line => lines(:one), :position => '23132,1321313', :range => 6, :active => true}))
  end

  it "renders attributes in <p>" do
    render
  end
end
