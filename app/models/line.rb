class Line < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true, allow_blank: false
end
