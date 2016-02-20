class City < ActiveRecord::Base

  validates :name, uniqueness: true, presence: true, allow_blank: false
  validates :state_id, presence: true, allow_blank: false

  belongs_to :state
  has_many :lines


end
