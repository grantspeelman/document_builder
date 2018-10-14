class InputElement < ApplicationRecord
  AVAILABLE_HTML_TYPES = %w(checkbox color date datetime-local email month number password tel text time url week).freeze

  validates :label, presence: true
  validates :html_type, inclusion: { in: AVAILABLE_HTML_TYPES }

  def available_html_types
    AVAILABLE_HTML_TYPES
  end
end
