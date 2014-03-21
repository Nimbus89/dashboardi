class MappingFunctionsController < ApplicationController
  before_action :set_project
  before_action :set_mapping_function, only: [:edit, :update, :destroy]

  # GET /mapping_functions/new
  def new
    @mapping_function = @project.mapping_functions.new
  end

  # GET /mapping_functions/1/edit
  def edit
  end

  # POST /mapping_functions
  # POST /mapping_functions.json
  def create
    @mapping_function = @project.mapping_functions.new(mapping_function_params)

    respond_to do |format|
      if @mapping_function.save
        format.html { redirect_to @project, notice: 'Mapping function was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mapping_function }
      else
        format.html { render action: 'new' }
        format.json { render json: @mapping_function.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mapping_functions/1
  # PATCH/PUT /mapping_functions/1.json
  def update
    respond_to do |format|
      if @mapping_function.update(mapping_function_params)
        format.html { redirect_to @project, notice: 'Mapping function was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mapping_function.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mapping_functions/1
  # DELETE /mapping_functions/1.json
  def destroy
    @mapping_function.destroy
    respond_to do |format|
      format.html { redirect_to @project }
      format.json { head :no_content }
    end
  end

  private
    def set_project
      @project = Project.find(params[:project_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_mapping_function
      @mapping_function = @project.mapping_functions.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mapping_function_params
      params.require(:mapping_function).permit(:input_key, :output_key, :default_value, :project_id, range_mappings_attributes: [ :max_value, :min_value, :output_value, :_destroy, :id ])
    end
end
