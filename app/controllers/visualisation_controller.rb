class VisualisationController < ApplicationController
  
  layout "visu_layout"
  
  def example
  end

  def show
  	@project = Project.find(params[:project_id])

    startpage = params[:page_id] || 0
    @project_json = render_to_string( "project", locals: {project: @project, startpage: startpage}, layout: false)
  end

    def with_format(format, &block)
	  old_formats = formats
	  self.formats = [format]
	  block.call
	  self.formats = old_formats
	  nil
	end
end
