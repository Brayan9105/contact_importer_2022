# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImportContactFileJob do
  describe '#perform_async' do
    subject(:perform_async) { described_class.new.perform(contact_file_id) }

    before do
      allow(ContactFileServices::Import).to receive(:call).with(contact_file)
    end

    let(:contact_file_id) { contact_file.id }
    let!(:contact_file) { create(:contact_file) }

    it 'sets job configs', :aggregate_failures do
      expect(described_class).to be_processed_in :contact_file
      expect(described_class).to be_retryable true
    end

    it 'calls for the expected service' do
      Sidekiq::Testing.inline! do
        perform_async

        expect(ContactFileServices::Import).to have_received(:call).with(contact_file)
      end
    end

    context 'with wrong contact file id' do
      let(:contact_file_id) { 0 }

      it do
        expect(perform_async).to be_nil
      end

      it 'does not call the expected service' do
        Sidekiq::Testing.inline! do
          perform_async

          expect(ContactFileServices::Import).not_to have_received(:call)
        end
      end
    end
  end
end
