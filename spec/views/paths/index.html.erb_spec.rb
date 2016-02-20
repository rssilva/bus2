require 'rails_helper'

RSpec.describe "paths/index", type: :view do
  fixtures :all

  before(:each) do
    assign(:paths, [
      Path.create!(
        :line => lines(:three),
        :data => "MyText"
      ),
      Path.create!(
        :line => lines(:four),
        :data => "MyText"
      )
    ])
  end

  it "renders a list of paths" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
