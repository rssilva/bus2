require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do

  		it {
        should validate_presence_of :name
        should validate_presence_of :email
        should validate_presence_of :password
      }

      it {
        should_not allow_value("blah").for(:email)
        should_not allow_value("bla@gmail").for(:email)
        should_not allow_value("").for(:email)
        should_not allow_value("").for(:name)
      }

      it { should have_one(:score)}

      it { should validate_uniqueness_of(:email) }

      it { should have_secure_password }

  end
end
