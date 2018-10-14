module DocumentTemplates
  class LinkedElementsController < BaseController
    def new
      @element_types = LinkedElement.all_types
    end

    def destroy
      @document_template.find_linked_element(params[:id]).destroy
      redirect_to document_template_path(@document_template), notice: 'successfully deleted'
    end
  end
end
