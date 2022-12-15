# frozen_string_literal: true

module ContactFileServices
  # Allows to import the contacts in a csv file
  class Import < ApplicationService
    require 'csv'

    # @param [Object<ContactFile>] contact_file object of type ContactFile
    def initialize(contact_file)
      @contact_file = contact_file
      @valid_contacts = []
      @log_errors = []
    end

    # starts the import process. it reads each row of a csv file and validates the contact data
    # before creating it, if the data is not valid the ContactFile model will store the associated errors.
    #
    # @param (see Import#initialize)
    def call
      contact_file.processing!

      CSV.foreach(file_path, headers: true).with_index(2) do |row_data, index|
        save_contact(build_contact(row_data), index)
      end

      add_errors if log_errors.any?

      valid_contacts.any? ? contact_file.finished! : contact_file.failed!
    end

    private

    attr_accessor :contact_file, :valid_contacts, :log_errors

    def file_path
      @file_path ||= ActiveStorage::Blob.service.path_for(contact_file.file.key)
    end

    def build_contact(row_data)
      attributes = %i[name date_of_birth phone address credit_card_number email]

      Contact.new(user: contact_file.user, contact_file: contact_file).tap do |contact|
        attributes.each do |attribute|
          contact[attribute] = attribute_value(row_data, attribute)
        end
      end
    end

    def attribute_value(row_data, attribute)
      row_data[contact_file.contact_columns[attribute.to_s]]
    end

    def save_contact(contact, index)
      return build_error_message(contact, index) unless contact.save

      valid_contacts << contact
    end

    def build_error_message(contact, index)
      log_errors << "Error in the row #{index}: #{contact.errors.full_messages.join(', ')};"
    end

    def add_errors
      contact_file.update(errors_log: log_errors.join(', '))
    end
  end
end
