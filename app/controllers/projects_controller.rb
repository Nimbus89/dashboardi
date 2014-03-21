class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :destroy, :show]


  before_filter :authenticate_user!
  
  before_filter :check_user, only: [:show, :edit, :update, :destroy]
  # GET /projects
  # GET /projects.json
  def index
    @projects = current_user.projects
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @new_page = Page.new({project: @project, name: generate_new_page_name})
    @new_data_source = DataSource.new({project: @project})
    @pages_list = @project.pages.map {|i| [i.id, i.name]}
    @data_sources = @project.data_sources.includes(:data_source_type)
  end

  # GET /projects/new
  def new
    @project = current_user.projects.new
  end

  # GET /projects/1/edit
  def edit
    @project.last_modified = Time.now
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.projects.new(project_params)
    new_page = @project.pages.new({ name: generate_new_page_name})
    @project.startpage = new_page
    @project.date_created = Time.now
    @project.last_modified = Time.now
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project }
        format.json { respond_with_bip(@project) }
      else
        format.html { render action: 'edit' }
        format.json { respond_with_bip(@project) }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  private
  


    def check_user
      fail "Wrong User" unless current_user == @project.user
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:background_colour, :foreground_colour, :panel_colour, :text_colour, :name, :date_created, :startpage_id, :last_modified, :description, :private, :screensize_x, :screensize_y, :user_id, pages_attributes: [
        :id, :name, :_destroy, panels_attributes:[
          :id, :_destroy, :x, :y, :properties
        ]
      ])
    end

    def bip_format_collection( pages )
      pages.map {|i| [i.id, i.name]}
    end

    def generate_new_page_name
      if (@project.pages.where name: "New Page").size != 0
        i = 0
        while (@project.pages.where name: "New Page (#{i})").size != 0
          i = i + 1
        end
        "New Page (#{i})"
      else
        "New Page"
      end
    end
end
