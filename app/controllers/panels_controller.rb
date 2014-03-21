class PanelsController < ApplicationController
  before_action :set_panel, only: [:show, :edit, :update, :destroy]

  def show
  end

  # GET /panels/1/edit
  def edit
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


    if @panel.save
      redirect_to @panel
    else
      render json: @panel.errors, status: :unprocessable_entity
    end

  end

  # PATCH/PUT /panels/1
  # PATCH/PUT /panels/1.json
  def update
    respond_to do |format|
      if @panel.update(panel_params)
        format.js
      else
        format.json { render json: @panel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /panels/1
  # DELETE /panels/1.json
  def destroy
    topage = @panel.page
    @panel.destroy
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
