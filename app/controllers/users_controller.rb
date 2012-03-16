require "digest"

class UsersController < ApplicationController
	after_filter :base

	#private
	def base
		#if is_user?
		#	redirect_to :controller => "journals", :action => "index"
		#	return
		#end
	end

	def show
		#render :action => 'register'
	end

	def login
		if is_user?
			redirect_to :controller => "journals", :action => "index"
		end
		
		if request.post?
			session[:login] = nil

			login = params[:login]
			password = Digest::MD5.hexdigest(params[:pass])
			if User.authenticate(login, password) 
			  session[:login] = login
			  session[:password] = password
			  redirect_to :controller => "journals", :action => "index"
			else
			  flash[:notice]='Invalid login or password'
			end
		end
	end

	def register
		if is_user?
			redirect_to :controller => "journals", :action => "index"
		end

		if request.post?
			@user = User.new(params[:user])

			if @user.save
				session[:login] = login
			  	session[:password] = @user.password
			else

      		end
		else
			@user = User.new
		end
	end
end
