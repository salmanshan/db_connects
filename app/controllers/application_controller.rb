class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_current_user

  private

  def set_current_user
    return unless current_user

    Thread.current[:databases] = current_user.databases.pluck(:name, :url).to_h.to_json
  end
end
