# frozen_string_literal: true

# Manages the flow for contact requests
class ContactsController < ApplicationController
  # @url /contact_files
  # @action GET
  #
  # Returns a list of the current user contact imported and render the index view
  def index
    @contacts = current_user.contacts
  end
end
