class UtensilnamesController < ApplicationController
  before_action :set_utensilname, only: [:show, :edit, :update, :destroy]

  # GET /utensilnames
  # GET /utensilnames.json
  def index
    @utensilnames = Utensilname.all
  end

  # GET /utensilnames/1
  # GET /utensilnames/1.json
  def show
  end

  # GET /utensilnames/new
  def new
    @utensilname = Utensilname.new
  end

  # GET /utensilnames/1/edit
  def edit
  end

  # POST /utensilnames
  # POST /utensilnames.json
  def create
    @utensilname = Utensilname.new(utensilname_params)

    respond_to do |format|
      if @utensilname.save
        format.html { redirect_to utensilnames_path }
        format.json { render :show, status: :created, location: @utensilname }
      else
        format.html { render :new }
        format.json { render json: @utensilname.errors, status: :unprocessable_entity }
      end
    end
  end


  def check_utensil_present
    if Utensil.find_by(:utensilname_id=>(params[:utensilname_id])).present?
      msg = "Utensil already Exists"
    else
      msg = ""
    end
    render json: {"message"=> msg}
  end

  

  def check_utensilname_present
 
    if Utensilname.find_by('lower(name) = ?',params[:name].downcase).present?
      msg = "Utensil Name already Exists"
    else
      msg = ""
    end
    render json: {"message"=> msg}
  end





  # PATCH/PUT /utensilnames/1
  # PATCH/PUT /utensilnames/1.json
  def update
    respond_to do |format|
      if @utensilname.update(utensilname_params)
        format.html { redirect_to utensilnames_path }
        format.json { render :show, status: :ok, location: @utensilname }
      else
        format.html { render :edit }
        format.json { render json: @utensilname.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /utensilnames/1
  # DELETE /utensilnames/1.json
  def destroy
    @utensilname.destroy
    respond_to do |format|
      format.html { redirect_to utensilnames_url, notice: 'Utensilname was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_utensilname
      @utensilname = Utensilname.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def utensilname_params
      params.require(:utensilname).permit(:name, :description)
    end
end
