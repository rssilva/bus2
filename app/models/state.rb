class State < ActiveRecord::Base

  validates :name, uniqueness: true, presence: true, allow_blank: false
  validates :uf, uniqueness: true, presence: true, allow_blank: false
  validates :country_id, presence: true, allow_blank: false

  belongs_to :country
  has_many :cities
end
