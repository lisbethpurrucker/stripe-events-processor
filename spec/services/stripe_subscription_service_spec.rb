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
      event_data = double('Stripe data', object: double('Stripe object', subscription: subscription.stripe_id))
      event = double('Stripe event', data: event_data)

      service.pay(event)

      expect(subscription.reload.status).to eq('paid')
    end
  end

  describe '#cancel' do
    context 'when subscription is paid' do
      it 'updates subscription status to canceled' do
        subscription = Subscription.create(stripe_id: 'sub_123', status: 'paid')
        event = double('Stripe event', data: double('Stripe data', object: double('Stripe object', id: subscription.stripe_id)))

        service.cancel(event)

        expect(subscription.reload.status).to eq('canceled')
      end
    end

    context 'when subscription is not paid' do
      it 'does not update subscription status' do
        subscription = Subscription.create(stripe_id: 'sub_123', status: 'unpaid')
        event = double('Stripe event', data: double('Stripe data', object: double('Stripe object', id: subscription.stripe_id)))

        service.cancel(event)

        expect(subscription.reload.status).to eq('unpaid')
      end
    end
  end
end
