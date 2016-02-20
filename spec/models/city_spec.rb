require 'rails_helper'

RSpec.describe City, type: :model do
  context 'validations' do
    it {
      should validate_presence_of :name
      should validate_presence_of :state_id
    }

    it {
      should_not allow_value("").for(:name)
      should_not allow_value(nil).for(:state_id)
    }
  end
end
