class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #attr_accessible :email, :password, :password_confirmation,
  #                :remember_me

  validate :email_domain

  def email_domain
    domain = email.split("@").last
    if !email.blank?
      errors.add(:email, "Invalid Domain. Ask administrators to add this email domain.") if Domain.where(domain: domain).empty?
    end
  end
end
