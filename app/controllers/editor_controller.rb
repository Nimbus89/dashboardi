class EditorController < ApplicationController

  layout "editor"

  def show
  	@page = Page.find(params[:page_id])

  	@palette = PanelType.all
  end
end
