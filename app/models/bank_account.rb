class BankAccount < ApplicationRecord

  validates :user_id, presence: true
  validates :bankaccount_id, presence: true
  validates :bankaccount_number, presence: true
  validates :balance, presence: true

  def has_required_fields?
    self.user_id && self.bankaccount_id && self.bankaccount_number && self.balance
  end
end
