class Score < ActiveRecord::Base
  belongs_to :user

  validates :user, :user_id, presence: true, allow_blank: false
  validates_uniqueness_of :user

  before_save :add_hit

  def add_hit
    self.hits = self.hits.to_i + 1
    self.last_hit = Time.now
  end

end
