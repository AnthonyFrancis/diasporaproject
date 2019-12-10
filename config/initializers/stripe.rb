Rails.configuration.stripe = {
  publishable_key: Rails.application.credentials[Rails.env.to_sym][:stripe_public],
  secret_key: Rails.application.credentials[Rails.env.to_sym][:stripe_secret]
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
