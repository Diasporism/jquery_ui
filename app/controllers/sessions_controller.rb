class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    @session = Session.new(params[:session])
    @session.valid?
    user = login(params[:session][:username], params[:session][:password])
    if user
      redirect_to root_url, :notice => 'Logged in!'
    else
      flash.now.alert = 'Invalid username or password!'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => 'Logged out!'
  end
end