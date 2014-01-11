class @ApplicationController
  constructor: (socket) ->
    @socket = socket
    @panelFactory = new window.PanelFactory(@socket, this)
    $(".page").height(window.project.screensize_y)
    $(".page").width(window.project.screensize_x)
    @changePage(window.project.startpage_id)

  displayCurrentPage: =>
    @panelFactory.create(panel) for id, panel of @currentPage.panels

  changePage: (pageNum) =>
    @currentPage = window.project.pages[pageNum]
    $(".page").html("")
    @displayCurrentPage()