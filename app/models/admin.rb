class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,# :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:admin_number]

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if admin_number = conditions.delete(:admin_number)
      where(conditions).where(admin_number: admin_number).first
    else
      where(conditions).first
    end
  end

  # 登録時に email を不要にする
  def email_required?
    false
  end
  def email_changed?
    false
  end
end
