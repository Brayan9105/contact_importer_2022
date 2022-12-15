# frozen_string_literal: true

# Enqueue a job to be performed as soon as the queuing system is free,
class ImportContactFileJob
  include Sidekiq::Worker

  sidekiq_options queue: :contact_file

  # Calls the import service to start the import process
  #
  # @param [Integer] contact_file_id the id of the contact file
  def perform(contact_file_id)
    contact_file = ContactFile.find_by(id: contact_file_id)
    return unless contact_file

    ContactFileServices::Import.call(contact_file)
  end
end
