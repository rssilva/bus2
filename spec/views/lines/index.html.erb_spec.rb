require 'rails_helper'

RSpec.describe "lines/index", type: :view do
  before(:each) do
    assign(:lines, [
      Line.create!(
        :name => "Name",
        :city_id => 1
      ),
      Line.create!(
        :name => "Name 2",
        :city_id => 1
      )
    ])
  end

  it "renders a list of lines" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 1
    assert_select "tr>td", :text => "Name 2".to_s, :count => 1
  end
end
