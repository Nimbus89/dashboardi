class DataSourcesController < ApplicationController
  before_action :set_data_source, only: [:show, :edit, :update, :destroy]

  # GET /data_sources
  # GET /data_sources.json
  def index
    @data_sources = DataSource.all
  end

  # GET /data_sources/1
  # GET /data_sources/1.json
  def show
    redirect_to @data_source.project
  end

  # GET /data_sources/new
  def new
    @data_source = DataSource.new({project_id: params[:project_id], data_source_type_id: params[:data_source_type_id]})
  end

  # GET /data_sources/1/edit
  def edit
  end

  # POST /data_sources
  # POST /data_sources.json
  def create
    @data_source = DataSource.new(data_source_params)

    respond_to do |format|
      if @data_source.save
        format.html { redirect_to @data_source.project, notice: 'Data source was successfully created.' }
        format.json { render action: 'show', status: :created, location: @data_source }
      else
        format.html { render action: 'new' }
        format.json { render json: @data_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data_sources/1
  # PATCH/PUT /data_sources/1.json
  def update
    respond_to do |format|
      if @data_source.update(data_source_params)
        format.html { redirect_to @data_source, notice: 'Data source was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @data_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_sources/1
  # DELETE /data_sources/1.json
  def destroy
    @data_source.destroy
    respond_to do |format|
      format.html { redirect_to @data_source.project }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_source
      @data_source = DataSource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def data_source_params
      params.require(:data_source).permit(:project_id, :data_source_type_id).tap do |whitelisted|
        if(params[:data_source].has_key?(:fields))
          whitelisted[:fields] = params[:data_source][:fields]
        end
      end
    end
end
