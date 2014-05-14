class Subscription
  include ActiveModel::Model
  attr_accessor :mentoring, :price

  def has_mentoring?
    mentoring
  end

  def charge(credit_card)
    credit_card.charge(price)
  end
end

class NoSubscription
  def charge(credit_card)
  end

  def has_mentoring?
    false
  end

  def price
    0
  end
end
