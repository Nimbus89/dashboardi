class @ApplicationController
  constructor: (socket) ->
    @socket = socket
    @panelFactory = new window.PanelFactory(@socket, this)
    @changePage(window.project.startpage_id)

  displayCurrentPage: =>
    @panelFactory.create(panel) for id, panel of @currentPage.panels

  changePage: (pageNum) =>
    @currentPage = window.project.pages[pageNum]
    $(".page").html("")
    @displayCurrentPage()