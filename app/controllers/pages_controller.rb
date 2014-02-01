class PagesController < ApplicationController
  before_action :set_page, only: [:show, :update, :edit, :destroy]

  before_filter :authenticate_user!

  before_filter :check_user, only: [:update, :edit, :destroy]

  before_filter :check_public_user, only: [:show]

  layout :resolve_layout

  # GET /pages/1
  # GET /pages/1.json
  def show
    @project = @page.project
    @startpage_id = @page.id
    @project_json = render_to_string( "visualisation/project", locals: {project: @project}, layout: false)
    render "visualisation/show"
  end

  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page.project }
        format.js
      else
        format.html { redirect_to @page.project }
        format.json { render json: @panel.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit  
    @palette = PanelType.all
    render "editor/edit"
  end

  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to @page.project }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    def check_user
      fail "Wrong User" unless current_user == @page.user
    end

    def check_public_user
      if @page.project.private
        fail "Wrong User" unless current_user == Project.find(params[:project_id]).user
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:name, :project_id)
    end

    def resolve_layout
      case action_name
      when "edit"
        "editor"
      when "show"
        "visu_layout"
      else
        "application"
      end
    end
end
