class PanelsController < ApplicationController
  before_action :set_panel, only: [:show, :edit, :update, :destroy]

  # GET /panels
  # GET /panels.json
  def index
    @panels = Panel.all
  end

  # GET /panels/1
  # GET /panels/1.json
  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /panels/new
  def new
    @panel = Panel.new(panel_type_id: params[:panel_type_id], page_id: params[:page_id])
  end

  # GET /panels/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /panels
  # POST /panels.json
  def create
    @panel = Panel.new(panel_params)

    @panel.panel_type.panel_fields.each do |panel_field|
      if panel_field.default_value != nil
        @panel.properties[panel_field.name] = panel_field.default_value
      end
    end

    respond_to do |format|
      if @panel.save
        format.html { redirect_to @panel, notice: 'Panel was successfully created.' }
        format.js { redirect_to @panel }
      else
        format.html { render action: 'new' }
        format.json { render json: @panel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /panels/1
  # PATCH/PUT /panels/1.json
  def update
    respond_to do |format|
      puts "\nPanel Params:" + panel_params.to_s + "\n"
      if @panel.update(panel_params)
        format.html { redirect_to @panel, notice: 'Panel was successfully updated.' }
        format.js
      else
        format.html { render action: 'edit' }
        format.json { render json: @panel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /panels/1
  # DELETE /panels/1.json
  def destroy
    topage = @panel.page
    @panel.destroy
    respond_to do |format|
      format.html { redirect_to topage }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_panel
      @panel = Panel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def panel_params
      params.require(:panel).permit(:id, :x, :y, :page_id, :panel_type_id).tap do |whitelisted|
        if(params[:panel].has_key?(:properties))
          whitelisted[:properties] = params[:panel][:properties]
        end
      end
    end
end
