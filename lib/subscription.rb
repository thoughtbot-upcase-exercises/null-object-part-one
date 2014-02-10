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
