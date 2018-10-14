class DocumentTemplatesController < ApplicationController
  before_action :authenticate_account!
  before_action :set_document_template, only: [:show, :edit, :update, :destroy]

  # GET /document_templates
  def index
    @document_templates = DocumentTemplate.for_account(current_account)
  end

  # GET /document_templates/1
  def show
  end

  # GET /document_templates/new
  def new
    @document_template = DocumentTemplate.new
  end

  # GET /document_templates/1/edit
  def edit
  end

  # POST /document_templates
  def create
    @document_template = DocumentTemplate.new(document_template_params)
    @document_template.account = current_account

    if @document_template.save
      redirect_to @document_template, notice: 'Document template was successfully created.'
    else
      render :new, status: 400
    end
  end

  # PATCH/PUT /document_templates/1
  def update
    if @document_template.update(document_template_params)
      redirect_to @document_template, notice: 'Document template was successfully updated.'
    else
      render :edit, status: 400
    end
  end

  # DELETE /document_templates/1
  def destroy
    @document_template.destroy
    redirect_to document_templates_url, notice: 'Document template was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_template
      @document_template = DocumentTemplate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def document_template_params
      params.require(:document_template).permit(:title)
    end
end
