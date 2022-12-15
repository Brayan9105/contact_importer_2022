# frozen_string_literal: true

# == Schema Information
#
# Table name: contacts
#
#  id                           :bigint           not null, primary key
#  address                      :string
#  credit_card_last_four_digits :string
#  credit_card_network          :string
#  credit_card_number           :string
#  date_of_birth                :string
#  email                        :string
#  name                         :string
#  phone                        :string
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  contact_file_id              :bigint           not null
#  user_id                      :bigint           not null
#
# Indexes
#
#  index_contacts_on_contact_file_id    (contact_file_id)
#  index_contacts_on_email_and_user_id  (email,user_id) UNIQUE
#  index_contacts_on_user_id            (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (contact_file_id => contact_files.id)
#  fk_rails_...  (user_id => users.id)
#
class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :contact_file

  validates :name, :address, :date_of_birth, :phone, :credit_card_number, :email, :credit_card_network,
            :credit_card_last_four_digits, presence: true
  validates :name, format: { with: /\A[a-zA-Z\s-]+\z/,
                             message: I18n.t('invalid_characters') }
  validates :email, uniqueness: { scope: :user_id, case_sensitive: false, message: I18n.t('email_already_imported') },
                    format: { with: /\A[\w+\-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/ }

  validates :phone, format: { with: /\A(\(\+\d{2}\)\s\d{3}\s\d{3}\s\d{2}\s\d{2})|
                                    (\(\+\d{2}\)\s\d{3}-\d{3}-\d{2}-\d{2})\z/x,
                              message: I18n.t('allowed_phone_format') }

  validate :date_of_birth_validation

  before_validation :set_credit_card_network, :set_credit_card_last_four_digits

  private

  def date_of_birth_validation
    Date.iso8601(date_of_birth)
  rescue Date::Error
    errors.add(:date_of_birth, I18n.t('invalid_dob_format'))
  end

  def set_credit_card_network
    brand_name = CreditCardValidations::Detector.new(credit_card_number).brand_name
    self.credit_card_network = brand_name
  end

  def set_credit_card_last_four_digits
    return if credit_card_number.blank?

    self.credit_card_last_four_digits = credit_card_number&.last(4)
    self.credit_card_number = BCrypt::Password.create(credit_card_number)
  end
end
