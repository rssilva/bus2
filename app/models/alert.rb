class Alert < ActiveRecord::Base
  belongs_to :user
  belongs_to :line

  validates :user, :line, :position, :range, :active, presence: true, allow_blank: false
end
