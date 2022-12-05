# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe 'valid factory' do
    it { expect(build(:user)).to be_valid }
  end
end
