class AuditFeedbackCategoriesController < ApplicationController
  before_action :set_audit_feedback_category, only: [:show, :edit, :update, :destroy]

  # GET /audit_feedback_categories
  # GET /audit_feedback_categories.json
  def index
    @audit_feedback_categories = AuditFeedbackCategory.all
  end

  # GET /audit_feedback_categories/1
  # GET /audit_feedback_categories/1.json
  def show
  end

  # GET /audit_feedback_categories/new
  def new
    @audit_feedback_category = AuditFeedbackCategory.new
  end

  # GET /audit_feedback_categories/1/edit
  def edit
  end

  # POST /audit_feedback_categories
  # POST /audit_feedback_categories.json
  def create
    
    @audit_feedback_category = AuditFeedbackCategory.new(audit_feedback_category_params)

    respond_to do |format|
      if @audit_feedback_category.save
        format.html { redirect_to audit_feedback_categories_path }
        format.json { render :show, status: :created, location: @audit_feedback_category }
      else
        format.html { render :new }
        format.json { render json: @audit_feedback_category.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /audit_feedback_categories/1
  # PATCH/PUT /audit_feedback_categories/1.json
  def update
    respond_to do |format|
      if @audit_feedback_category.update(audit_feedback_category_params)
        format.html { redirect_to audit_feedback_categories_path }
        format.json { render :show, status: :ok, location: @audit_feedback_category }
      else
        format.html { render :edit }
        format.json { render json: @audit_feedback_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def audit_report
  end

  # DELETE /audit_feedback_categories/1
  # DELETE /audit_feedback_categories/1.json
  def destroy
    @audit_feedback_category.destroy
    respond_to do |format|
      format.html { redirect_to audit_feedback_categories_url, notice: 'Audit feedback category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audit_feedback_category
      @audit_feedback_category = AuditFeedbackCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def audit_feedback_category_params
      params.require(:audit_feedback_category).permit(:category_name, :category_desc, :status)
    end
end
