# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    def index; end
  end

  describe 'handling authenticate_user!' do
    it 'redirects to the sign in page' do
      get :index
      expect(response).to redirect_to('/users/sign_in')
    end
  end
end
