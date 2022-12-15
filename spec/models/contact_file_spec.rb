# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ContactFile do
  describe 'valid factory' do
    it { expect(build(:contact_file)).to be_valid }
  end

  describe 'validations' do
    it { is_expected.to belong_to(:user) }

    it { is_expected.to validate_presence_of(:file) }
    it { is_expected.to validate_presence_of(:contact_columns) }
    it { is_expected.to validate_attached_of(:file) }
    it { is_expected.to validate_content_type_of(:file).allowing('text/csv').rejecting('text/plain', 'text/xml') }
  end
end
