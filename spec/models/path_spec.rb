require 'rails_helper'

RSpec.describe Path, type: :model do
  it {
    should validate_presence_of :line
  }

  it {
    should_not allow_value("").for(:line_id)
  }

  it {
    should validate_uniqueness_of(:line)
  }

  it {
    should belong_to :line
  }

end
