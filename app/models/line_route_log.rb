class LineRouteLog < ActiveRecord::Base
  belongs_to :user
  belongs_to :line

  include LineInstanceRouteLog

  def readonly?
    true
  end

end
