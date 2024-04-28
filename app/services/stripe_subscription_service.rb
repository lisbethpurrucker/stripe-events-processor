# Service handling Stripe subscription events
class StripeSubscriptionService
  def create(event)
    subscription_id = event.data.object.id
    find_or_create_subscription(subscription_id)
  end

  def pay(event)
    subscription_id = event.data.object.subscription
    subscription = find_or_create_subscription(subscription_id)
    update_subscription_status(subscription, 'paid')
  end

  def cancel(event)
    subscription_id = event.data.object.id
    subscription = find_or_create_subscription(subscription_id)
    update_subscription_status(subscription, 'canceled') if subscription.paid?
  end

  private

  def find_or_create_subscription(subscription_id)
    Subscription.find_or_create_by(stripe_id: subscription_id)
  end

  def update_subscription_status(subscription, status)
    subscription.update(status:)
  end
end
