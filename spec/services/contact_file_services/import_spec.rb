# frozen_string_literal: true

require 'rails_helper'

describe ContactFileServices::Import do
  describe '#call' do
    subject(:call) { described_class.call(contact_file) }

    let!(:contact_file) { create(:contact_file) }

    it do
      expect { call }.to change(Contact, :count).by(2)
    end

    it 'changes the contact file status to finished' do
      call

      contact_file.reload

      expect(contact_file).to be_finished
    end

    context 'with at least 1 contact with correct data' do
      let!(:contact_file) { create(:contact_file, file: fixture_file_upload('one_valid_contact.csv')) }
      let(:error_log) do
        'Error in the row 3: Name Special characters is not allowed, you can use only -, ' \
          'Email This email has already been imported;'
      end

      it 'changes the contact file status to finished' do
        call

        contact_file.reload

        expect(contact_file).to be_finished
      end

      it do
        expect { call }.to change(Contact, :count).by(1)
      end

      it do
        call

        contact_file.reload

        expect(contact_file.errors_log).to eq(error_log)
      end
    end

    context 'with all contacts with wrong data' do
      let!(:contact_file) { create(:contact_file, file: fixture_file_upload('all_invalid_contacts.csv')) }
      let(:error_log) do
        'Error in the row 2: Name Special characters is not allowed, you can use only -;, Error in the row 3: ' \
          "Credit card network can't be blank, Date of birth the field must comply with the following format " \
          'YYYYMMDD or YYYY-MM-DD;'
      end

      it 'changes the contact file status to failed' do
        call

        contact_file.reload

        expect(contact_file).to be_failed
      end

      it do
        expect { call }.not_to change(Contact, :count)
      end

      it do
        call

        contact_file.reload

        expect(contact_file.errors_log).to eq(error_log)
      end
    end

    context 'with wrong columns name' do
      let!(:contact_file) { create(:contact_file, contact_columns: contact_columns) }
      let(:contact_columns) do
        {
          name: 'Nombre',
          date_of_birth: 'Date of Birth',
          phone: 'Phone',
          address: 'Address',
          credit_card_number: 'Credit Card',
          email: 'Email'
        }
      end
      let(:error_log) do
        "Error in the row 2: Name can't be blank, Name Special characters is not allowed, you can use only -;, " \
          "Error in the row 3: Name can't be blank, Name Special characters is not allowed, you can use only -;"
      end

      it do
        call

        contact_file.reload

        expect(contact_file.errors_log).to eq(error_log)
      end
    end
  end
end
