class User
  include ActiveModel::Model
  attr_accessor :credit_card
  attr_writer :subscription

  def subscription
    @subscription || NoSubscription.new
  end

  def charge
    subscription.charge(credit_card)
  end

  def has_mentoring?
    subscription.has_mentoring?
  end

  def price
    subscription.price
  end
end
