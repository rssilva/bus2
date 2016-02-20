require 'rails_helper'

RSpec.describe "scores/show", type: :view do
  fixtures :all
  before(:each) do
    @score = assign(:score, Score.create!({:user => users(:one)}))
  end

  it "renders attributes in <p>" do
    render
  end
end
