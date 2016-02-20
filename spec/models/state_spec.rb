require 'rails_helper'

RSpec.describe State, type: :model do
  context 'validations' do
    it {
      should validate_presence_of :name
      should validate_presence_of :uf
      should validate_presence_of :country_id
    }

    it {
      should_not allow_value("").for(:name)
      should_not allow_value("").for(:uf)
      should_not allow_value(nil).for(:country_id)
    }
  end
end
