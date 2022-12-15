# frozen_string_literal: true

# Manages the flow for contact file requests
class ContactFilesController < ApplicationController
  # @url /contact_files
  # @action GET
  #
  # Returns a list of the current user contact files and render the index view
  def index
    @pagy, @contact_files = pagy(current_user.contact_files, items: 10)
  end

  # @url /contact_files/#{id}
  # @action GET
  #
  # Returns a contact files and render the show view
  #
  # @param [Integer] id the id of the contact file
  def show
    @contact_file = ContactFile.includes(:contacts).find(params[:id])
  end

  # @url /contact_files/new
  # @action GET
  #
  # Returns a empty contact file instance and render the new view
  def new
    @contact_file = ContactFile.new
  end

  # @url /contact_files
  # @action POST
  #
  # Saves the contact file in db then enqueue a job and render the index view,
  # if the validations fail, return the instance with the errors and render the new view
  #
  # param [Hash] contact_file_params the params to create a contact file
  def create
    @contact_file = current_user.contact_files.build(contact_file_params)

    return render :new unless @contact_file.save

    ImportContactFileJob.perform_async(@contact_file.id)

    redirect_to contact_files_path, notice: I18n.t('file_successfully_imported')
  end

  private

  def contact_file_params
    params.require(:contact_file).permit(:file,
                                         contact_columns: %i[name date_of_birth phone address credit_card_number email])
  end
end
