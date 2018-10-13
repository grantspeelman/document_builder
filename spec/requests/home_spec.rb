require 'rails_helper'

RSpec.describe 'home', type: :request do

  it 'renders home page' do
    Account.create!(email: 'person@mail.com', password: '123123123')

    get '/'
    expect(response.body).to include('Please login')
    expect(response.body).to_not include('Welcome')

    post '/accounts/sign_in', params: { account: { email: 'person@mail.com', password: '123123123' } }
    expect(response).to redirect_to('/')
    follow_redirect!

    expect(response.body).to include('Welcome')
    expect(response.body).to_not include('Please login')
  end
end