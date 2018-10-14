require 'rails_helper'

RSpec.describe InputElement, type: :model do
  it 'can be created' do
    InputElement.create!(label: 'test', html_type: 'text')
  end
end
