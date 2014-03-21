class CombinationFunctionsController < ApplicationController
  before_action :set_project
  before_action :set_combination_function, only: [:edit, :update, :destroy]


  # GET /combination_functions/new
  def new
    @combination_function = @project.combination_functions.new
  end

  # GET /combination_functions/1/edit
  def edit
  end

  # POST /combination_functions
  # POST /combination_functions.json
  def create
    @combination_function = @project.combination_functions.new(combination_function_params)

    respond_to do |format|
      if @combination_function.save
        format.html { redirect_to @project, notice: 'Combination function was successfully created.' }
        format.json { render action: 'show', status: :created, location: @combination_function }
      else
        format.html { render action: 'new' }
        format.json { render json: @combination_function.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /combination_functions/1
  # PATCH/PUT /combination_functions/1.json
  def update
    respond_to do |format|
      if @combination_function.update(combination_function_params)
        format.html { redirect_to @project, notice: 'Combination function was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @combination_function.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /combination_functions/1
  # DELETE /combination_functions/1.json
  def destroy
    @combination_function.destroy
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
    def set_combination_function
      @combination_function = @project.combination_functions.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def combination_function_params
      params.require(:combination_function).permit(:output_key, :time_range, :function, :project_id, input_keys_attributes: [:id, :_destroy, :key])
    end
end
