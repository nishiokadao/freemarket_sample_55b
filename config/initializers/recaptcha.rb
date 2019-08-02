Recaptcha.configure do |config|
  config.credentials = {
    site_key: Rails.application.credentials.RECAPTCHA_PUBLIC_KEY,
    secret_key:Rails.application.credentials.RECAPTCHA_PRIVATE_KEY
  }
end