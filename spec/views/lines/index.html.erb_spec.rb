require 'rails_helper'

RSpec.describe "lines/index", type: :view do
  before(:each) do
    assign(:lines, [
      Line.create!(
        :name => "Name"
      ),
      Line.create!(
        :name => "Name 2"
      )
    ])
  end

  it "renders a list of lines" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 1
    assert_select "tr>td", :text => "Name 2".to_s, :count => 1
  end
end
