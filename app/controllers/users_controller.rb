class UsersController < ApplicationController
  def create
    @user = User.where(username: params[:username]).first_or_create
  end
end
