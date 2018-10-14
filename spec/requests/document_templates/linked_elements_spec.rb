require 'rails_helper'

RSpec.describe 'LinkedElementsController', type: :request do
  describe 'logged in' do
    let!(:account) { Account.create!(email: 'person@mail.com', password: '123123123') }

    before do
      post '/accounts/sign_in', params: { account: { email: account.email, password: account.password } }
      expect(response).to redirect_to('/')
    end

    describe '/document_templates/:document_template_id' do
      let!(:document_template) { DocumentTemplate.create!(account: account, title: 'test') }

      describe "GET /linked_elements/new" do
        it "works" do
          get "/document_templates/#{document_template.to_param}/linked_elements/new"
          expect(response).to have_http_status(200)
        end
      end
    end
  end
end
