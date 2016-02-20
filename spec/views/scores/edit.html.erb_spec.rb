require 'rails_helper'

RSpec.describe "scores/edit", type: :view do
  fixtures :all
  before(:each) do
    @score = assign(:score, Score.create!({:user => users(:one)}))
  end

  it "renders the edit score form" do
    render

    assert_select "form[action=?][method=?]", score_path(@score), "post" do
    end
  end
end
