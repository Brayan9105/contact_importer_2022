# frozen_string_literal: true

module ContactHelper
  def format_date(date_of_birth)
    Date.iso8601(date_of_birth).strftime('%Y %B %d')
  end
end
