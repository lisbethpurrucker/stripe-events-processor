# Service handling Stripe subscription events
class StripeSubscriptionService
  def create(event)
    subscription_id = event.data.object.id
    Subscription.create(stripe_id: subscription_id)
  end

  def pay(event)
    subscription_id = event.data.object.subscription
    update_subscription_status(subscription_id, 'paid')
  end

  def cancel(event)
    subscription_id = event.data.object.id
    update_subscription_status(subscription_id, 'canceled')
  end

  private

  def update_subscription_status(subscription_id, status)
    subscription = Subscription.find_or_initialize_by(stripe_id: subscription_id)
    subscription.update(status:)
  end
end
