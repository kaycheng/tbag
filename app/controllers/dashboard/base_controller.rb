class Dashboard::BaseController < ApplicationController
  layout "backend"
  before_action :authenticate_user!
  before_action :authenticate_admin

  private
  def authenticate_admin
    unless current_user.admin?
      redirect_to root_path, notice: "Not allowed"
    end
  end
end