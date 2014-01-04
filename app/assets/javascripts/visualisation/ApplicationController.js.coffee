class @ApplicationController
  constructor: (socket) ->
    @socket = socket
    @panelFactory = new window.PanelFactory(@socket, this)
    @changePage(0)

  displayCurrentPage: =>
    @panelFactory.create(panel) for panel in @currentPage.panels

  changePage: (pageNum) =>
    @currentPage = window.project.pages[pageNum]
    $(".page").html("")
    @displayCurrentPage()