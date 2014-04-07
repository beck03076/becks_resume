class SessionsController < ApplicationController
   def create
      user = User.from_omniauth(env["omniauth.auth"])
      session[:user_id] = user.id
      if current_user.beck?
        redirect_to root_path
      else
        redirect_to user_path(user.id)
      end
   end
 
   def destroy
     session[:user_id] = nil
     redirect_to root_path
   end
end
