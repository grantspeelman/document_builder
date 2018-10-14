module DocumentTemplates
  class HtmlElementsController < BaseController
    def new
      @html_element = HTMLElement.new
    end

    def create
      @html_element = HTMLElement.new(element_params)

      if @html_element.save
        @document_template.add_element(@html_element)
        redirect_to document_template_path(@document_template), notice: 'Element was successfully created.'
      else
        render :new, status: 400
      end
    end

    protected

    def element_params
      params.require(:html_element).permit(:content)
    end
  end
end
