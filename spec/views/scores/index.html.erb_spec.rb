require 'rails_helper'

RSpec.describe "scores/index", type: :view do
  fixtures :all
  before(:each) do
    assign(:scores, [
      Score.create!({:user => users(:one)}),
      Score.create!({:user => users(:two)})
    ])
  end

  it "renders a list of scores" do
    render
  end
end
