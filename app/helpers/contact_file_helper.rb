# frozen_string_literal: true

module ContactFileHelper
  def process_status(contact_file)
    return 'primary' if contact_file.processing?

    contact_file.finished? ? 'success' : 'danger'
  end
end
