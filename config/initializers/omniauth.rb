Rails.application.config.middleware.use OmniAuth::Builder do

  if ENV["RAILS_ENV"] == "test"
    uri = 'http://127.0.0.1:9876/auth/google_oauth2/callback'
    id = "412836660909.apps.googleusercontent.com"
    key = "9THYqMEcuFRQtuCObnn148cQ"
  elsif ENV["RAILS_ENV"] == "development"
    uri = 'http://127.0.0.1:3000/auth/google_oauth2/callback'
    id = "412836660909-8lg07tv17irtds7gh1ebt5snd807devn.apps.googleusercontent.com"
    key = "3w6BYZsilv6uuUoAx1lI5Hto"
  elsif ENV["RAILS_ENV"] == "production"
    uri = 'http://www.becksresume.com/auth/google_oauth2/callback'
    id = "412836660909-1rvr4hd7us17cpg333re9m5fd9vb9cgd.apps.googleusercontent.com"
    key = "kM2wH0mrFtMmXKLWyS51BV8r"
  end
    
  
  provider :google_oauth2, id, key , {
    access_type: 'offline',
    scope: 'https://www.googleapis.com/auth/userinfo.email',
    redirect_uri: uri
  }
end
