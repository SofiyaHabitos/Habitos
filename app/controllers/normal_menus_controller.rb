class NormalMenusController < ApplicationController
  before_action :set_normal_menu, only: [:show, :edit, :update, :destroy]

  # GET /normal_menus
  # GET /normal_menus.json
  def index
    @normal_menus = NormalMenu.all
  end

  # GET /normal_menus/1
  # GET /normal_menus/1.json
  def show
  end

  # GET /normal_menus/new
  def new
    @normal_menu = NormalMenu.new
  end

  # GET /normal_menus/1/edit
  def edit
  end

  # POST /normal_menus
  # POST /normal_menus.json
  def create
    @normal_menu = NormalMenu.new(normal_menu_params)

    respond_to do |format|
      if @normal_menu.save
        @normal_menu.update(:created_by=>session[:kitchen_user_id])
        format.html { redirect_to @normal_menu, notice: 'Normal menu was successfully created.' }
        format.json { render :show, status: :created, location: @normal_menu }
      else
        format.html { render :new }
        format.json { render json: @normal_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /normal_menus/1
  # PATCH/PUT /normal_menus/1.json
  def update
    respond_to do |format|
      if @normal_menu.update(normal_menu_params)
        @normal_menu.update(:updated_by=>session[:kitchen_user_id])
        format.html { redirect_to @normal_menu, notice: 'Normal menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @normal_menu }
      else
        format.html { render :edit }
        format.json { render json: @normal_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /normal_menus/1
  # DELETE /normal_menus/1.json
  def destroy
    @normal_menu.destroy
    respond_to do |format|
      format.html { redirect_to normal_menus_url, notice: 'Normal menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_normal_menu
      @normal_menu = NormalMenu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def normal_menu_params
      params.fetch(:normal_menu, {})
    end
end
