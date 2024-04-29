# spec/models/subscription_spec.rb

require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:stripe_id) }
    it { should validate_presence_of(:status) }
  end

  describe 'enums' do
    it { should define_enum_for(:status).with_values(unpaid: 0, paid: 1, canceled: -1) }
  end
end
