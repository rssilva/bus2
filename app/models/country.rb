class Country < ActiveRecord::Base

  validates :name, uniqueness: true, presence: true, allow_blank: false

  has_many :states

end
