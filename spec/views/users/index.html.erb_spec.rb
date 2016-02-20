require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!({:name => 'fulano',:email => 'john@doe.com', :password => 'test', :password_confirmation => 'test'}),
      User.create!({:name => 'fulano',:email => 'jane@doe.com', :password => 'test', :password_confirmation => 'test'})
    ])
  end

  it "renders a list of users" do
    render
  end
end
