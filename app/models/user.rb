class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  def admin?
    self.is_admin
  end
end