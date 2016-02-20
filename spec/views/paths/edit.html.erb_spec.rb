require 'rails_helper'

RSpec.describe "paths/edit", type: :view do
  fixtures :all
  before(:each) do
    @path = assign(:path, Path.create!(
      :line => lines(:three),
      :data => "MyText"
    ))
  end

  it "renders the edit path form" do
    render

    assert_select "form[action=?][method=?]", path_path(@path), "post" do

      assert_select "input#path_line_id[name=?]", "path[line_id]"

      assert_select "textarea#path_data[name=?]", "path[data]"
    end
  end
end
