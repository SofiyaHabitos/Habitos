class NutritionsController < ApplicationController
  before_action :set_nutrition, only: [:show, :edit, :update, :destroy]

  # GET /nutritions
  # GET /nutritions.json
  def index
    @nutritions = Nutrition.all
    #@nutritions = Nutrition.paginate(:page => params[:page], :per_page => 10)

  end

  # GET /nutritions/1
  # GET /nutritions/1.json
  def show
  end

  # GET /nutritions/new
  def new
    @nutrition = Nutrition.new
  end

  # GET /nutritions/1/edit
  def edit

  end

  # POST /nutritions
  # POST /nutritions.json
  def create
    
    @nutrition = Nutrition.new(nutrition_params)
    @nutrition.production_item_id = ProductionItem.find_by(:name=>params[:nutrition][:production_item_id]).id
    @nutrition.minerals=Hash[*params[:nutrition][:minerals]]
    @nutrition.vitamins=Hash[*params[:nutrition][:vitamins]]
   
    respond_to do |format|

      if @nutrition.save
        ProductionItem.find(@nutrition.production_item_id).update(allergy:params["allergy"])
        @nutrition.update(:created_by=>session[:kitchen_user_id])
        format.html { redirect_to nutritions_url, notice: 'Nutrition was successfully created.' }
        format.json { render :show, status: :created, location: @nutrition }
      else
        format.html { render :new }
        format.json { render json: @nutrition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nutritions/1
  # PATCH/PUT /nutritions/1.json
  def update
    respond_to do |format|
      if @nutrition.update(nutrition_params)
         min=Hash[*params[:nutrition][:minerals]]
        vit=Hash[*params[:nutrition][:vitamins]]
        @nutrition.update(minerals:min,vitamins:vit)
        ProductionItem.find(@nutrition.production_item_id).update(allergy:params["allergy"])

        #@nutrition.update(:minerals=> [nutrition_params[:minerals].split(",") && nutrition_params[:minerals].split(" ")].flatten,:vitamins=>[nutrition_params[:vitamins].split(",") && nutrition_params[:vitamins].split(" ")].flatten)
        #@nutrition.update(:minerals=> [nutrition_params][:minerals].split(",").flatten,:vitamins=>[nutrition_params][:vitamins].split(",").flatten)
        @nutrition.update(:updated_by=>session[:kitchen_user_id])
        format.html { redirect_to nutritions_url, notice: 'Nutrition was successfully updated.' }
        format.json { render :show, status: :ok, location: @nutrition }
      else
        format.html { render :edit }
        format.json { render json: @nutrition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nutritions/1
  # DELETE /nutritions/1.json
  def destroy
    @nutrition.destroy
    respond_to do |format|
      format.html { redirect_to nutritions_url, notice: 'Nutrition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nutrition
       unless params[:id] == "undefined"
      @nutrition = Nutrition.find(params[:id])
    else
     redirect_to nutritions_url
    end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nutrition_params

      #params.fetch(:nutrition, {})
      params.require(:nutrition).permit!#(:production_item_id, :quantity, :caloire, :protein, :fat, :carbohydrates, :fibre, :unit_of_measurement_id, [:minerals], [:vitamins])
    end
end
