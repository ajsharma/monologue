class ReposController < ApplicationController
  before_action :set_repo, only: [:show]

  # GET /repos
  # GET /repos.json
  def index
    @repos = current_user.repos
  end

  # GET /repos/1
  # GET /repos/1.json
  def show
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_repo
    @repo = current_user.repos.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def repo_params
    params.require(:repo).permit(:provider_id, :name, :full_name, :description, :private, :fork)
  end

end
