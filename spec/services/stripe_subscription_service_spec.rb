require 'rails_helper'

RSpec.describe StripeSubscriptionService do
  let(:service) { described_class.new }

  describe '#create' do
    it 'creates a new subscription' do
      event = double('Stripe event', data: double('Stripe data', object: double('Stripe object', id: 'sub_123')))

      expect { service.create(event) }.to change(Subscription, :count).by(1)
    end
  end

  describe '#pay' do
    it 'updates subscription status to paid' do
      subscription = Subscription.create(stripe_id: 'sub_123')
      event = double('Stripe event', data: double('Stripe data', object: double('Stripe object', subscription: subscription.stripe_id)))

      service.pay(event)

      expect(subscription.reload.status).to eq('paid')
    end
  end

  describe '#cancel' do
    it 'updates subscription status to canceled' do
      subscription = Subscription.create(stripe_id: 'sub_123')
      event = double('Stripe event', data: double('Stripe data', object: double('Stripe object', id: subscription.stripe_id)))

      service.cancel(event)

      expect(subscription.reload.status).to eq('canceled')
    end
  end
end
