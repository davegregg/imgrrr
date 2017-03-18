Unsplash.configure do |config|
  ENV['AWS_ACCESS_KEY_ID']
  config.application_id     = ''
  config.application_secret = ''
  # config.application_redirect_uri = "https://your-application.com/oauth/callback"
end
