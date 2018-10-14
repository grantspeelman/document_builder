require 'rails_helper'

RSpec.describe HTMLElement, type: :model do
  it 'allows to create' do
    HTMLElement.create(content: '<p>Hello!</p>')
  end
end
