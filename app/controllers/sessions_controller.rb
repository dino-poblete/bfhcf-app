class SessionsController < ApplicationController

  def new
    #redirect_to signin_path
  end

  def create
    user = User.find_by_email(params[:email].downcase)
    if user && user.authenticate(params[:password])
      sign_in user
      redirect_back_or root_url
      #redirect_to root_url, :notice => "Logged in!"
      # Sign the user in and redirect to the home page.

    else
      flash[:error] = 'Invalid email/password combination'
      redirect_to signin_path
      #redirect_to signin_path, :flash => { :error => "Invalid email/password combination" }
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
