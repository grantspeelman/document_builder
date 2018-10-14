class CompletedDocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  def create
    @completed_document = CompletedDocument.new_for(account: current_account, template_id: params.fetch(:template_id))
    @completed_document.save!
    redirect_to edit_completed_document_path(@completed_document)
  end

  def show
  end

  def edit
  end

  def update
    if @completed_document.update(document_params)
      redirect_to @completed_document, notice: 'Document was successfully updated.'
    else
      render :edit, status: 400
    end
  end

  protected

  def set_document
    @completed_document = CompletedDocument.for_account(current_account).find(params[:id])
  end

  def document_params
    params.require(:completed_document)
      .permit(linked_elements_attributes: [:id, {element_attributes: [:id, :content] }])
  end
end
