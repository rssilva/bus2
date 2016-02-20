require 'rails_helper'

RSpec.describe "paths/new", type: :view do
  fixtures :all
  before(:each) do
    assign(:path, Path.new(
      :line => lines(:three),
      :data => "MyText"
    ))
  end

  it "renders new path form" do
    render

    assert_select "form[action=?][method=?]", paths_path, "post" do

      assert_select "input#path_line_id[name=?]", "path[line_id]"

      assert_select "textarea#path_data[name=?]", "path[data]"
    end
  end
end
