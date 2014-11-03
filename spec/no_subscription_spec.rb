require 'spec_helper'

describe NoSubscription do
  it 'is free' do
    expect(NoSubscription.new.price).to eq 0
  end

  it 'does not have mentoring' do
    expect(NoSubscription.new.has_mentoring?).to be_false
  end

  it 'does not charge the credit card' do
    subscription = NoSubscription.new
    credit_card = double('credit_card')
    credit_card.stub('charge')

    subscription.charge(credit_card)

    expect(credit_card).not_to have_received(:charge)
  end
end
