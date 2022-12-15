# frozen_string_literal: true

# == Schema Information
#
# Table name: contact_files
#
#  id              :bigint           not null, primary key
#  contact_columns :jsonb            not null
#  errors_log      :text
#  status          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_contact_files_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :contact_file do
    association :user

    contact_columns do
      {
        name: 'Name',
        date_of_birth: 'Date of Birth',
        phone: 'Phone',
        address: 'Address',
        credit_card_number: 'Credit Card',
        email: 'Email'
      }
    end
    status { :on_hold }
    file { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/all_valid_contacts.csv'), 'text/csv') }
  end
end
