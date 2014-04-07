Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "412836660909.apps.googleusercontent.com", "9THYqMEcuFRQtuCObnn148cQ", {
    access_type: 'offline',
    scope: 'https://www.googleapis.com/auth/userinfo.email',
    redirect_uri: 'http://www.becksresume.com/auth/google_oauth2/callback'
  }
end
