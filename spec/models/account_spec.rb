require 'rails_helper'

RSpec.describe Account, type: :model do
  it 'is creatable' do
    Account.create!(email: 'person@mail.com', password: '123123123')
  end
end
