require 'rails_helper'

RSpec.describe Alert, type: :model do
  context 'validations' do

      it {
        should validate_presence_of :user_id
        should validate_presence_of :line_id
        should validate_presence_of :range
        should validate_presence_of :position
        should validate_presence_of :active
      }

      it {
        should_not allow_value("").for(:position)
        should_not allow_value("").for(:range)
      }

  end
end
