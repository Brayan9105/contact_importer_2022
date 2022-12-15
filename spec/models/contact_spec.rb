# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact do
  describe 'valid factory' do
    it { expect(build(:contact)).to be_valid }
  end

  describe 'validations' do
    subject(:contact) { described_class.new }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:date_of_birth) }
    it { is_expected.to validate_presence_of(:credit_card_network) }
    it { is_expected.to validate_presence_of(:credit_card_number) }
    it { is_expected.to validate_presence_of(:credit_card_last_four_digits) }

    it { is_expected.to allow_value('John-Doe', 'John Doe').for(:name) }

    it do
      expect(contact).not_to allow_value('John_Doe')
        .for(:name)
        .with_message('Special characters is not allowed, you can use only -')
    end

    it { is_expected.to allow_value('test@mail.com').for(:email) }
    it { is_expected.not_to allow_value('testmail.com').for(:email) }

    it { is_expected.to allow_value('(+00) 000 000 00 00', '(+00) 000-000-00-00').for(:phone) }

    it do
      expect(contact).not_to allow_value('(+00) 0000000000')
        .for(:phone)
        .with_message('Only the formats (+00) 000 000 00 00 and (+00) 000-000-00-00 are allowed')
    end

    it { is_expected.to allow_value('19960110', '1996-01-10').for(:date_of_birth) }

    it do
      expect(contact).not_to allow_value('1996/01/10')
        .for(:date_of_birth)
        .with_message('the field must comply with the following format YYYYMMDD or YYYY-MM-DD')
    end

    context 'with an already imported mail' do
      subject(:contact) { build(:contact, credit_card_network: 'MasterCard') }

      it do
        expect(contact).to validate_uniqueness_of(:email)
          .scoped_to(:user_id)
          .with_message('This email has already been imported')
          .case_insensitive
      end
    end
  end

  describe '#before_validation' do
    let(:contact) { build(:contact) }

    before { contact.save }

    it 'sets the credit card network' do
      expect(contact.credit_card_network).to eq('MasterCard')
    end

    it 'sets the credit card last four numbers' do
      expect(contact.credit_card_last_four_digits).to eq('4444')
    end

    it 'encryts the credit card number' do
      expect(BCrypt::Password.new(contact.credit_card_number)).to eq '5555555555554444'
    end

    context 'with blank credit card number' do
      let(:contact) { build(:contact, credit_card_number: '') }

      it do
        expect(contact).not_to be_valid
      end

      it do
        expect(contact.credit_card_last_four_digits).to be_nil
      end
    end
  end
end
