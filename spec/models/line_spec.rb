require 'rails_helper'

RSpec.describe Line, type: :model do
  it {
    should validate_presence_of :name
  }

  it {
    should_not allow_value("").for(:name)
  }

  it { should have_one(:path)}

  it {
    should validate_uniqueness_of(:name)
  }

end
