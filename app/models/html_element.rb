class HTMLElement < ApplicationRecord
  include ActionView::Helpers::SanitizeHelper

  validates :content, presence: true

  def sanitized_content
    sanitize(content,
             tags: %w(strong em a h1 h2 h3 p i ul ol li table thead tbody tr th td blockquote figure),
             attributes: %w(href style))
  end
end
