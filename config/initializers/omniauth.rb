Rails.application.config.middleware.use OmniAuth::Builder do

  if ENV["RAILS_ENV"] == "test"
    uri = 'http://127.0.0.1:9876/auth/google_oauth2/callback'
  elsif ENV["RAILS_ENV"] == "development"
    uri = 'http://127.0.0.1:3000/auth/google_oauth2/callback'
  elsif ENV["RAILS_ENV"] == "production"
    uri = 'http://www.becksresume.com/auth/google_oauth2/callback'
  end
    
  
  provider :google_oauth2, "412836660909.apps.googleusercontent.com", "9THYqMEcuFRQtuCObnn148cQ", {
    access_type: 'offline',
    scope: 'https://www.googleapis.com/auth/userinfo.email',
    redirect_uri: uri
  }
end
