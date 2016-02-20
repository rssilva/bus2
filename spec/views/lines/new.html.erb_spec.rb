require 'rails_helper'

RSpec.describe "lines/new", type: :view do
  before(:each) do
    assign(:line, Line.new(
      :name => "MyString",
      :city_id => 1
    ))
  end

  it "renders new line form" do
    render

    assert_select "form[action=?][method=?]", lines_path, "post" do

      assert_select "input#line_name[name=?]", "line[name]"
    end
  end
end
