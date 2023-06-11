class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  before_validation { email.downcase! }
  has_secure_password
  validates :password, length: { minimum: 6 }

  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: true

  before_destroy :admin_cannot_delete

  private
  def admin_cannot_delete
    throw :abort if User.where(admin: true).count == 1 && self.admin == true
  end
end
