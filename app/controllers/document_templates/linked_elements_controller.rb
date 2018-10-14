module DocumentTemplates
  class LinkedElementsController < BaseController
    def new
      @element_types = LinkedElement.all_types
    end
  end
end
