module NestedUnderRepo
  extend ActiveSupport::Concern

  included do
    helper_method :current_org_name
    helper_method :current_repo_name
    helper_method :current_repository_full_name
  end

  def current_org_name
    params[:org]
  end

  def current_repo_name
    params[:repo]
  end

  def current_repository_full_name
    "#{current_org_name}/#{current_repo_name}"
  end

end
