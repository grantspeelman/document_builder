require 'rails_helper'

RSpec.describe DocumentTemplates::HtmlElementsController, type: :request do
  describe 'logged in' do
    let!(:account) { Account.create!(email: 'person@mail.com', password: '123123123') }

    before do
      post '/accounts/sign_in', params: { account: { email: account.email, password: account.password } }
      expect(response).to redirect_to('/')
    end

    describe '/document_templates/:document_template_id' do
      let!(:document_template) { DocumentTemplate.create!(account: account, title: 'test') }

      describe "GET /html_elements/new" do
        it "works" do
          get "/document_templates/#{document_template.to_param}/html_elements/new"
          expect(response).to have_http_status(200)
        end
      end

      describe "POST /html_elements" do
        context 'success' do
          it "works" do
            post "/document_templates/#{document_template.to_param}/html_elements",
                 params: { html_element: { content: '<p>Hello</p>' } }
            expect(response).to be_redirect
            expect(document_template.reload.linked_elements).to be_one
          end
        end

        context 'validation error' do
          it "works" do
            post "/document_templates/#{document_template.to_param}/html_elements",
                 params: { html_element: { content: '' } }
            expect(response).to have_http_status(400)
            expect(document_template.reload.linked_elements).to be_empty
          end
        end
      end
    end
  end
end
