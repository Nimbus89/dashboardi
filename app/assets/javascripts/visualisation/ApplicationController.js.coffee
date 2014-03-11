class @ApplicationController
  constructor: (project) ->
    @eHandler = new window.ErrorHandler()
    @socket = new window.Socket(project, @eHandler)
    @funcCont = new window.FunctionController(project, @socket)
    @panelFactory = new window.PanelFactory(@socket, this, @eHandler)
    $(".page").height(window.project.screensize_y)
    $(".page").width(window.project.screensize_x)
    $(".page").css("left", "50%");
    $(".page").css("margin-left", -(window.project.screensize_x/2) + "px");
    $(".page").css("top", "50%");
    $(".page").css("margin-top", -(window.project.screensize_y/2) + "px");
    @changePage(window.project.startpage_id)

  displayCurrentPage: =>
    @panelFactory.create(panel) for id, panel of @currentPage.panels

  changePage: (pageNum) =>
    @currentPage = window.project.pages[pageNum]
    $(".page").html("")
    @displayCurrentPage()