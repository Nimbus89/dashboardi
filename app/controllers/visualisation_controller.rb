class VisualisationController < ApplicationController
  
  layout "visu_layout"
  
  def example
  end

  def show
  	@project = Project.find(params[:project_id])

    if params.has_key? :page_id
      @startpage_id = params[:page_id]
    elsif (@project.panels.find_by id: @project.startpage) != nil
      @startpage_id = @project.startpage.id
    else
      @startpage_id = @project.panels.take.id
    end

    @project_json = render_to_string( "project", locals: {project: @project}, layout: false)
  end

    def with_format(format, &block)
	  old_formats = formats
	  self.formats = [format]
	  block.call
	  self.formats = old_formats
	  nil
	end
end
