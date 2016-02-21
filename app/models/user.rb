class User < ActiveRecord::Base
  validates :name, :email, :password, :password_confirmation, presence: true, if: "facebook_id.blank? || facebook_id.nil?"
  validates :email, uniqueness: true, if: "facebook_id.blank? || facebook_id.nil?"
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, if: "facebook_id.blank? || facebook_id.nil?"

  has_secure_password

  has_one :score
end
