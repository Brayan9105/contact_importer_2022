# frozen_string_literal: true

require 'rails_helper'

describe ContactsController do
  let(:user) { create(:user) }
  let!(:contacts) { create_list(:contact, 2, user: user) }

  before do
    sign_in user
  end

  describe 'GET index' do
    subject!(:get_index) { get contacts_path }

    it { expect(response).to have_http_status(:ok) }

    it 'assigns the contacts to the class variable' do
      expect(assigns(:contacts)).to match_array(contacts)
    end
  end
end
