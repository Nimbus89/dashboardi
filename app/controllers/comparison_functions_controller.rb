class ComparisonFunctionsController < ApplicationController
  before_action :set_project
  before_action :set_comparison_function, only: [:edit, :update, :destroy]

  # GET /comparison_functions/new
  def new
    @comparison_function = @project.comparison_functions.new
  end

  # GET /comparison_functions/1/edit
  def edit
  end

  # POST /comparison_functions
  # POST /comparison_functions.json
  def create
    @comparison_function = @project.comparison_functions.new(comparison_function_params)

    respond_to do |format|
      if @comparison_function.save
        format.html { redirect_to @project, notice: 'Comparison function was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comparison_function }
      else
        format.html { render action: 'new' }
        format.json { render json: @comparison_function.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comparison_functions/1
  # PATCH/PUT /comparison_functions/1.json
  def update
    respond_to do |format|
      if @comparison_function.update(comparison_function_params)
        format.html { redirect_to @project, notice: 'Comparison function was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comparison_function.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comparison_functions/1
  # DELETE /comparison_functions/1.json
  def destroy
    @comparison_function.destroy
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
    def set_comparison_function
      @comparison_function = @project.comparison_functions.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comparison_function_params
      params.require(:comparison_function).permit(:constant, :input_key, :second_input, :function, :output_key, :project_id)
    end
end
