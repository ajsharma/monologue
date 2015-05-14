module RequiresCurrentUser
  extend ActiveSupport::Concern

  included do
    before_filter :require_current_user
  end

  def require_current_user
    redirect_to :signin unless current_user.present?
  end


end
