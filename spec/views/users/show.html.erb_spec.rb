require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!({:name => 'John',:email => 'john@doe.com', :password => 'test', :password_confirmation => 'test'}))
  end

  it "renders attributes in <p>" do
    render
  end
end
