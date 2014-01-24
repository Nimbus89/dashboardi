class EditorController < ApplicationController

  layout "editor"

  before_filter :authenticate_user!

  before_filter :check_user, only: [:show]

  def show
  	@page = Page.find(params[:page_id])

  	@palette = PanelType.all
  end

  private
  	def check_user
      fail "Wrong User" unless current_user == Page.find(params[:page_id]).user
    end

end
