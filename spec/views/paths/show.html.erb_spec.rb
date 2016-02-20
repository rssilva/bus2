require 'rails_helper'

RSpec.describe "paths/show", type: :view do
  fixtures :all
  before(:each) do
    @path = assign(:path, Path.create!(
      :line => lines(:three),
      :data => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
