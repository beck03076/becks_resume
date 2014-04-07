class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
 
  def current_user
    @current_user ||= (User.find(session[:user_id]) if session[:user_id]) 
  end
  
  def resume
    @technologies = YAML.load(File.open("#{Rails.root}/data/technologies.yml"))
    @experience = YAML.load(File.open("#{Rails.root}/data/experience.yml"))
    render 'main/resume'
  end
  
  def tooltip
    render 'main/tooltip'
  end
 
end
