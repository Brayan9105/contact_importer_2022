# frozen_string_literal: true

require 'rails_helper'

describe 'ContactFiles', type: :feature do
  before do
    visit '/users/sign_in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  let(:user) { create(:user) }

  describe '#index' do
    it do
      visit contacts_path

      expect(page).to have_content('contacts successfully imported')
    end
  end
end
