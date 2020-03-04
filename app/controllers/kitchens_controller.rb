class KitchensController < ApplicationController
  before_action :set_kitchen, only: [:show, :edit, :update, :destroy]

  # GET /kitchens
  # GET /kitchens.json
  def index
    @kitchens = Kitchen.all
    #@kitchens = Kitchen.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /kitchens/1
  # GET /kitchens/1.json
  def show
  end

  # GET /kitchens/new
  def new
    @kitchen = Kitchen.new
  end

  # GET /kitchens/1/edit
  def edit
  end

  # POST /kitchens
  # POST /kitchens.json
  def create
    @kitchen = Kitchen.new(kitchen_params)

    #respond_to do |format|
       @kitchen.save
       @kitchen.update(:created_by=>session[:kitchen_user_id])
        redirect_to action: "index", notice: 'Kitchen was successfully created.' 
     #   format.json { render :show, status: :created, location: @kitchen }
      #else
       # format.html { render :new }
        #format.json { render json: @kitchen.errors, status: :unprocessable_entity }
      #end
    #end
  end

  # PATCH/PUT /kitchens/1
  # PATCH/PUT /kitchens/1.json
  def update
    respond_to do |format|
      if @kitchen.update(kitchen_params)
        @kitchen.update(:updated_by=>session[:kitchen_user_id])
        format.html { redirect_to action: "index", notice: 'Kitchen was successfully updated.' }
        format.json { render :show, status: :ok, location: @kitchen }
      else
        format.html { render :edit }
        format.json { render json: @kitchen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kitchens/1
  # DELETE /kitchens/1.json
  def destroy
    @kitchen.destroy
    respond_to do |format|
      format.html { redirect_to kitchens_url, notice: 'Kitchen was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

   def chef
    @data=Kitchen.chefscreen
  end  
  def check_facilit_present
   
    if Kitchen.where(:name=>(params[:username])).present?
      msg = "This kitchen is already assigned to another person"
          render json: {"message"=> msg}
    else
      msg = ""
          render json: {"message"=> msg}
    end
   end
    

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kitchen
      unless params[:id] == "undefined"
       @kitchen = Kitchen.find(params[:id])
    else
       redirect_to kitchens_url
    end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kitchen_params 
      params.require(:kitchen).permit(:name, :responsible_person, :address)
      #params.fetch(:kitchen, {:name, :responsible_person, :address})
    end
end
