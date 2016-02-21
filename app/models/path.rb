class Path < ActiveRecord::Base
  belongs_to :line

  validates :line, :line_id, presence: true, allow_blank: false, uniqueness: true
end
