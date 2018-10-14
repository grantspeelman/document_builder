require 'rails_helper'

RSpec.describe DocumentTemplates::InputElementsController, type: :request do
  describe 'logged in' do
    let!(:account) { Account.create!(email: 'person@mail.com', password: '123123123') }

    before do
      post '/accounts/sign_in', params: { account: { email: account.email, password: account.password } }
      expect(response).to redirect_to('/')
    end

    describe '/document_templates/:document_template_id' do
      let!(:document_template) { DocumentTemplate.create!(account: account, title: 'test') }

      describe "GET /input_elements/new" do
        it "works" do
          get "/document_templates/#{document_template.to_param}/input_elements/new"
          expect(response).to have_http_status(200)
        end
      end

      describe "POST /input_elements" do
        context 'success' do
          it "works" do
            post "/document_templates/#{document_template.to_param}/input_elements",
                 params: { input_element: { label: 'test', html_type: 'text' } }
            expect(response).to be_redirect
            expect(document_template.reload.linked_elements).to be_one
          end
        end

        context 'validation error' do
          it "works" do
            post "/document_templates/#{document_template.to_param}/input_elements",
                 params: { input_element: { label: 'test', html_type: 'wrong' } }
            expect(response).to have_http_status(400)
            expect(document_template.reload.linked_elements).to be_empty
          end
        end
      end
    end
  end
end
