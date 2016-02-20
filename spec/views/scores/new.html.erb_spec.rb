require 'rails_helper'

RSpec.describe "scores/new", type: :view do
  fixtures :all
  before(:each) do
    assign(:score, Score.new({:user => users(:one)}))
  end

  it "renders new score form" do
    render

    assert_select "form[action=?][method=?]", scores_path, "post" do
    end
  end
end
