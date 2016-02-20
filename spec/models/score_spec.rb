require 'rails_helper'

RSpec.describe Score, type: :model do
  fixtures :all
  context 'validations' do
    it {
      should validate_presence_of :user
    }

    it {
      should_not allow_value("").for(:user_id)
    }
  end

end
