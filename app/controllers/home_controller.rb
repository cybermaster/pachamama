class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    if current_user.role? :admin
      @users = User.find(:all, :conditions => {:roles => {:name => "admin"}}, :joins => :roles)
      @users = @users + User.find(:all, :conditions => {:roles => {:name => "captain"}}, :joins => :roles)
    elsif current_user.role? :captain
      @users = User.find(:all, :conditions => {:roles => {:name => "guest"}}, :joins => :roles)
    end
  end
end
