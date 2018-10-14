module DocumentTemplates
  class BaseController < ApplicationController
    before_action :authenticate_account!
    before_action :load_document_template

    protected

    def load_document_template
      @document_template = DocumentTemplate.for_account(current_account).find(params.fetch(:document_template_id))
    end
  end
end
