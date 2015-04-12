module ApplicationHelper

  def repo_full_name_to_org repo_full_name
    repo_full_name.split("/").first
  end

  def repo_full_name_to_name repo_full_name
    repo_full_name.split("/").last
  end

end
