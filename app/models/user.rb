class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  has_many :user_business_units
  has_many :business_units, through: :user_business_units
  accepts_nested_attributes_for :user_business_units, reject_if: :new_record?
  # attr_accessible :email, :password, :password_confirmation,
  #                :remember_me

  validate :email_domain

  def email_domain
    domain = email.split('@').last
    unless email.blank?
      errors.add(:email, 'Invalid Domain. Ask administrators to add this email domain.') if Domain.where(domain: domain).empty?
    end
  end
end
