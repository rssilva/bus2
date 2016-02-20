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

  describe 'save' do

		context 'with existing user score' do

			before :each do
        Score.destroy_all
        User.destroy_all
        @user = User.create!({:name => 'john', :email => 'lala@gmail.com', :password => 'test', :password_confirmation => 'test'})
  			@score = Score.create!({:user_id => @user.id})
  		end

  		it "should add 1 hit to existint score" do
        # post :score {:user_id => @user.id}
  			# expect(@score.hits).to eq(2)
  		end

		end

	end
end
