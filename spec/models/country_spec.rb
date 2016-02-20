require 'rails_helper'

RSpec.describe Country, type: :model do
  context 'validations' do
    it {
      should validate_presence_of :name
    }

    it {
      should_not allow_value("").for(:name)
    }
  end
end
