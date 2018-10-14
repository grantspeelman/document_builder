module DocumentTemplates
  class InputElementsController < BaseController
    def new
      @element = InputElement.new
    end

    def create
      @element = InputElement.new(element_params)

      if @element.save
        @document_template.add_element(@element)
        redirect_to document_template_path(@document_template), notice: 'Element was successfully created.'
      else
        render :new, status: 400
      end
    end

    protected

    def element_params
      params.require(:input_element).permit(:label, :html_type)
    end
  end
end
