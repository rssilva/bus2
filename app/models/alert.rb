class Alert < ActiveRecord::Base
  belongs_to :user
  belongs_to :line

  validates :user_id, :line_id, :position, :range, :active, presence: true, allow_blank: false
end
