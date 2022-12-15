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
FactoryBot.define do
  factory :contact do
    association :user
    association :contact_file

    name { Faker::Name.name.gsub(/\W/, '') }
    date_of_birth { Time.zone.today }
    phone { '(+57) 300-123-45-67' }
    address { Faker::Address.street_name }
    credit_card_number { '5555555555554444' }
    email { Faker::Internet.email }
  end
end
