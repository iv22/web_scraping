class Admin::LoadController < ActionController::Base
  before_action :authenticate_admin!

  def index
  end
end