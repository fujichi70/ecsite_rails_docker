class User < ApplicationRecord
  has_many :addresses, inverse_of: :user
  accepts_nested_attributes_for :addresses, allow_destroy: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
