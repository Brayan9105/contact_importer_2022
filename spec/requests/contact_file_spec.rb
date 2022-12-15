# frozen_string_literal: true

require 'rails_helper'

describe ContactFilesController do
  let(:user) { create(:user) }

  before { sign_in user }

  describe 'GET #new' do
    subject!(:get_new) { get new_contact_file_path }

    it { expect(response).to have_http_status :ok }
  end

  describe 'GET #index' do
    subject!(:get_index) { get contact_files_path }

    let(:user) { create(:user, contact_files: contact_files) }
    let(:contact_files) { create_list(:contact_file, 2) }

    it { expect(response).to have_http_status :ok }

    it 'assigns the contact files to the class variable' do
      expect(assigns(:contact_files)).to match_array(contact_files)
    end
  end

  describe 'POST #create' do
    subject(:post_create) { post contact_files_path, params: params }

    let(:params) do
      {
        contact_file: {
          file: fixture_file_upload('all_valid_contacts.csv'),
          contact_columns: {
            name: 'Name',
            date_of_birth: 'Date of Birth',
            phone: 'Phone',
            address: 'Address',
            credit_card_number: 'Credit Card',
            email: 'Email'
          }
        }
      }
    end

    it 'attaches a contact file' do
      expect { post_create }.to change(ActiveStorage::Attachment, :count).by(1)
    end

    it 'creates contact file' do
      expect { post_create }.to change(ContactFile, :count).by(1)
    end

    it 'enqueues a ImportContactJob' do
      post_create

      expect(ImportContactFileJob).to have_enqueued_sidekiq_job(ContactFile.first.id)
    end

    context 'with invalid params' do
      let(:params) { { contact_file: { file: nil } } }

      it do
        post_create

        expect(response).to render_template(:new)
      end
    end
  end
end
