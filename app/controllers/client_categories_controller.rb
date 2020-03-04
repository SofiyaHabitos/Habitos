class ClientCategoriesController < ApplicationController
  before_action :set_client_category, only: [:show, :edit, :update, :destroy]

  # GET /client_categories
  # GET /client_categories.json
  def index
    @client_categories = ClientCategory.all
  end

  # GET /client_categories/1
  # GET /client_categories/1.json
  def show
  end

  # GET /client_categories/new
  def new
    @client_category = ClientCategory.new
  end

  # GET /client_categories/1/edit
  def edit
  end

  # POST /client_categories
  # POST /client_categories.json
  def create
    @client_category = ClientCategory.new(client_category_params)

    respond_to do |format|
      if @client_category.save
        format.html { redirect_to client_categories_path, notice: 'Client category was successfully created.' }
        format.json { render :show, status: :created, location: @client_category }
      else
        format.html { render :new }
        format.json { render json: @client_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /client_categories/1
  # PATCH/PUT /client_categories/1.json
  def update
    respond_to do |format|
      if @client_category.update(client_category_params)
        format.html { redirect_to client_categories_path, notice: 'Client category was successfully updated.' }
        format.json { render :show, status: :ok, location: @client_category }
      else
        format.html { render :edit }
        format.json { render json: @client_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_categories/1
  # DELETE /client_categories/1.json
  def destroy
    @client_category.destroy
    respond_to do |format|
      format.html { redirect_to client_categories_url, notice: 'Client category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def check_name_present

    if ClientCategory.where(:name=>(params[:name])).present?
      msg = "Name already Exists"
          render json: {"message"=> msg}
    else
      msg = ""
          render json: {"message"=> msg}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_category
      @client_category = ClientCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_category_params
      params.require(:client_category).permit(:name)
    end
end
