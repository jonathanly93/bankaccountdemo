class Transaction < ApplicationRecord

  validates :bankaccount_number, presence: true
  validates :action, presence: true
  validates :transfer, presence: true

  def has_required_fields?
    self.bankaccount_number && self.action && self.transfer
  end

end
