class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :initialize_session, :load_favorites, :load_comparing

  protected

  def initialize_session
    session[:favorites] ||= []
    session[:comparing_laptops] ||= []
  end

  def load_favorites
    @favorites = Laptop.find(session[:favorites])
  end

  def load_comparing
    @comparing_laptops = Laptop.find(session[:comparing_laptops])
    # puts "comparing_laptops: #{@comparing_laptops}"
    # return @comparing_laptops
  end
end
