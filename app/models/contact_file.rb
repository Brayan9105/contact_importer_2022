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
class ContactFile < ApplicationRecord
  has_one_attached :file

  belongs_to :user
  has_many :contacts, dependent: :destroy

  enum status: {
    on_hold: 'on hold',
    processing: 'processing',
    failed: 'failed',
    finished: 'finished'
  }, _default: :on_hold

  validates :contact_columns, presence: true
  validates :file, attached: true, content_type: ['text/csv']
end
