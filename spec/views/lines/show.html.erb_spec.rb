require 'rails_helper'

RSpec.describe "lines/show", type: :view do
  before(:each) do
    @line = assign(:line, Line.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
