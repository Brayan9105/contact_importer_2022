# frozen_string_literal: true

require 'rails_helper'

describe 'ContactFiles', type: :feature do
  before do
    visit '/users/sign_in'
    fill_in 'user[email]', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  let(:user) { create(:user) }

  describe '#new' do
    let(:successful_message) do
      'the file has been uploaded successfully, now you must wait until the import process is finished.'
    end

    # rubocop: disable RSpec/ExampleLength
    it 'imports the contact file' do
      visit new_contact_file_path

      attach_file 'contact_file[file]', 'spec/fixtures/files/all_valid_contacts.csv'

      fill_in('contact_file[contact_columns][name]', with: 'Name')
      fill_in('contact_file[contact_columns][date_of_birth]', with: 'Date of Birth')
      fill_in('contact_file[contact_columns][phone]', with: 'Phone')
      fill_in('contact_file[contact_columns][address]', with: 'Address')
      fill_in('contact_file[contact_columns][credit_card_number]', with: 'Credit Card')
      fill_in('contact_file[contact_columns][email]', with: 'Email')

      click_on 'Import contact file'

      expect(page).to have_content(successful_message)
    end
    # rubocop: enable RSpec/ExampleLength
  end

  describe '#index' do
    it do
      visit contact_files_path

      expect(page).to have_content('Imported Files')
      expect(page).to have_content('File name')
      expect(page).to have_content('File status')
      expect(page).to have_content('Imported at')
    end
  end

  describe '#show' do
    let!(:contact_file) { create(:contact_file) }

    it do
      visit contact_file_path(contact_file)

      expect(page).to have_content('Errors')
      expect(page).to have_content('contacts successfully imported')
    end
  end
end
