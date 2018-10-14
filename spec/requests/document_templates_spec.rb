require 'rails_helper'

RSpec.describe DocumentTemplatesController, type: :request do
  describe 'logged in' do
    let!(:account) { Account.create!(email: 'person@mail.com', password: '123123123') }

    before do
      post '/accounts/sign_in', params: { account: { email: account.email, password: account.password } }
      expect(response).to redirect_to('/')
    end

    describe "GET /document_templates" do
      it "works" do
        get '/document_templates'
        expect(response).to have_http_status(200)
      end
    end

    describe "GET /document_templates/new" do
      it "works" do
        get '/document_templates'
        expect(response).to have_http_status(200)
      end
    end

    describe "POST /document_templates" do
      context 'success' do
        it "works" do
          post '/document_templates', params: { document_template: { title: 'My document' } }
          expect(response).to be_redirect
        end
      end

      context 'validation failure' do
        it 'works' do
          post '/document_templates', params: { document_template: { title: '' } }
          expect(response).to have_http_status(400)
        end
      end
    end

    describe "GET /document_templates/:id/edit" do
      it "works" do
        template = DocumentTemplate.create!(account: account, title: 'Doc')
        get "/document_templates/#{template.to_param}/edit"
        expect(response).to have_http_status(200)
      end
    end

    describe "PATCH /document_templates/:id" do
      let!(:template) { DocumentTemplate.create!(account: account, title: 'Doc') }

      context 'success' do
        it "works" do
          patch "/document_templates/#{template.to_param}", params: { document_template: { title: 'My document' } }
          expect(response).to be_redirect
        end
      end

      context 'validation failure' do
        it 'works' do
          patch "/document_templates/#{template.to_param}", params: { document_template: { title: '' } }
          expect(response).to have_http_status(400)
        end
      end
    end

    describe "DELETE /document_templates/:id" do
      let!(:template) { DocumentTemplate.create!(account: account, title: 'Doc') }

      it "works" do
        delete "/document_templates/#{template.to_param}"
        expect(response).to be_redirect
      end
    end
  end
end
