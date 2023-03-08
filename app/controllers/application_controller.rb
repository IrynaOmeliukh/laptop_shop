class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :initialize_session, :load_favorites

  protected

  def initialize_session
    session[:favorites] ||= []
  end

  def load_favorites
    @favorites = Laptop.find(session[:favorites])
  end
end
