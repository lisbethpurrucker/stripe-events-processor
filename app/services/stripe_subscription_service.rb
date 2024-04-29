# Service handling Stripe subscription events
class StripeSubscriptionService
  def create(event)
    subscription_id = event.data.object.id
    find_or_create_subscription(subscription_id)
  rescue StandardError => e
    puts "Error creating subscription: #{e.message}"
  end

  def pay(event)
    subscription_id = event.data.object.subscription
    subscription = find_or_create_subscription(subscription_id)
    update_subscription_status(subscription, 'paid')
  rescue StandardError => e
    puts "Error processing payment: #{e.message}"
  end

  def cancel(event)
    subscription_id = event.data.object.id
    subscription = find_or_create_subscription(subscription_id)
    update_subscription_status(subscription, 'canceled') if subscription&.paid?
  rescue StandardError => e
    puts "Error canceling subscription: #{e.message}"
  end

  private

  def find_or_create_subscription(subscription_id)
    Subscription.find_or_create_by(stripe_id: subscription_id)
  rescue ActiveRecord::RecordInvalid => e
    raise StandardError, "Invalid subscription: #{e.message}"
  end

  def update_subscription_status(subscription, status)
    subscription.update(status:)
  rescue ActiveRecord::RecordInvalid => e
    raise StandardError, "Error updating subscription status: #{e.message}"
  end
end
