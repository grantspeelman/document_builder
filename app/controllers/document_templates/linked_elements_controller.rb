module DocumentTemplates
  class LinkedElementsController < BaseController
    def new
      @element_types = ElementType.all
    end
  end
end
