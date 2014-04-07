Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "853539993661-t6l5ivb9v74uddm0kaq8edvr7jilrr3b.apps.googleusercontent.com", "mLk0to63wB_1Nt5RNRQ2MoRW", {
    access_type: 'offline',
    scope: 'https://www.googleapis.com/auth/userinfo.email',
    redirect_uri: 'http://www.becksresume.com/auth/google_oauth2/callback'
  }
end
