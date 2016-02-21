class Line < ActiveRecord::Base

  include LineInstance

  validates :name, uniqueness: true, presence: true, allow_blank: false
  validates :city_id, presence: true, allow_blank: false


  has_one :path
  belongs_to :city
end
