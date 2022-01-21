class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  has_many :reviews
  def admin?
    self.is_admin
  end
end