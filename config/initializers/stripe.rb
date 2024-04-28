Rails.configuration.stripe = {
  publishable_key: ENV.fetch('STRIPE_PUBLISHABLE_KEY'),
  secret_key:      ENV.fetch('STRIPE_SECRET_KEY'),
  signing_secret:  ENV.fetch('STRIPE_WEBHOOK_KEY')
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
StripeEvent.signing_secret = Rails.configuration.stripe[:signing_secret]

StripeEvent.configure do |events|
  events.subscribe 'customer.subscription.created' do |event|
    StripeSubscriptionService.new.create(event)
  end

  events.subscribe 'invoice.payment_succeeded' do |event|
    StripeSubscriptionService.new.pay(event)
  end

  events.subscribe 'customer.subscription.deleted' do |event|
    StripeSubscriptionService.new.cancel(event)
  end
end
