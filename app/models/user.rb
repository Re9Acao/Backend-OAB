class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  include DeviseTokenAuth::Concerns::User
  has_many :evaluations
  has_many :user_answers
  has_many :user_performances

  enum role: {
    admin: 0, 
    basic: 1, 
    premium: 2
  }, _default: :admin


   before_update :allow_password_change_for_admin

  private

  def allow_password_change_for_admin
    if admin?
      self.allow_password_change = true
    end
  end
end
