class User < ApplicationRecord

  validates :name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}

  def has_required_fields?
    self.name && self.password_digest && self.email
  end

  def verify_unique_email
    if User.exists? email: email
      errors.add :email, 'has already been taken'
    end
  end

  has_secure_password

  # 1. Expects a column named password
  # 2. Provides an attr_accessor :password
  # 3. Provides a method named .authenticate(pwd)

end
