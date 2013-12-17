class PanelTypesController < ApplicationController
  before_action :set_panel_type, only: [:show, :edit, :update, :destroy]

  # GET /panel_types
  # GET /panel_types.json
  def index
    @panel_types = PanelType.all
  end

  # GET /panel_types/1
  # GET /panel_types/1.json
  def show
  end

  # GET /panel_types/new
  def new
    @panel_type = PanelType.new
  end

  # GET /panel_types/1/edit
  def edit
  end

  # POST /panel_types
  # POST /panel_types.json
  def create
    @panel_type = PanelType.new(panel_type_params)

    respond_to do |format|
      if @panel_type.save
        format.html { redirect_to @panel_type, notice: 'Panel type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @panel_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @panel_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /panel_types/1
  # PATCH/PUT /panel_types/1.json
  def update
    respond_to do |format|
      if @panel_type.update(panel_type_params)
        format.html { redirect_to @panel_type, notice: 'Panel type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @panel_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /panel_types/1
  # DELETE /panel_types/1.json
  def destroy
    @panel_type.destroy
    respond_to do |format|
      format.html { redirect_to panel_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_panel_type
      @panel_type = PanelType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def panel_type_params
      params.require(:panel_type).permit(:name, panel_fields_attributes: [:field_type, :name, :_destroy, :id])
    end
end
