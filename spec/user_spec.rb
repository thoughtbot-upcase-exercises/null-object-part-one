require 'spec_helper'

describe User do
  describe '#charge' do
    it 'charges its subscription to its credit card' do
      credit_card = double('credit_card')
      subscription = double('subscription')
      subscription.stub(:charge)
      user = User.new(subscription: subscription, credit_card: credit_card)

      user.charge

      expect(subscription).to have_received(:charge).with(credit_card)
    end

    it 'does nothing without a subscription' do
      credit_card = double('credit_card')
      user = User.new(subscription: nil, credit_card: credit_card)

      expect { user.charge }.not_to raise_error
    end
  end

  describe '#has_mentoring?' do
    it 'delegates to its subscription' do
      has_mentoring = double('has_mentoring?')
      subscription = double('subscription', has_mentoring?: has_mentoring)
      user = User.new(subscription: subscription)

      expect(user.has_mentoring?).to eq(has_mentoring)
    end

    it 'returns false without a subscription' do
      user = User.new(subscription: nil)

      expect(user.has_mentoring?).to be_false
    end
  end

  describe '#price' do
    it 'delegates to its subscription' do
      price = double('price')
      subscription = double('subscription', price: price)
      user = User.new(subscription: subscription)

      expect(user.price).to eq(price)
    end

    it 'returns zero without a subscription' do
      user = User.new(subscription: nil)

      expect(user.price).to eq(0)
    end
  end
end
