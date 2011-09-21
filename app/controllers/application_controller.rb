class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_local

  def set_local
     I18n.locale='ar'
  end

end
