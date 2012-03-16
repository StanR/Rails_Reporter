class ApplicationController < ActionController::Base
  protect_from_forgery

  #check authorization
  #before_filter :base
  helper_method :is_user?


  def is_user?
  	login = session[:login]
	   password = session[:password]

	if @curUser = User.authenticate(login, password)
		true
	else
		false
	end

  end

end
