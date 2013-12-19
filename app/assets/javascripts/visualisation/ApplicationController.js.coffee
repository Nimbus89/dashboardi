class @ApplicationController
  constructor: (socket) ->
    @socket = socket
    @gridster = $(".gridster").gridster({
      widget_margins: [10, 10],
      widget_base_dimensions: [80, 80]
    }).data('gridster')
    @gridster.disable()
    @panelFactory = new window.PanelFactory(@gridster, @socket, this)
    @changePage(0)

  displayCurrentPage: =>
    @panelFactory.create(panel) for panel in @currentPage.panels

  changePage: (pageNum) =>
    @currentPage = window.project.pages[pageNum]
    @gridster.remove_all_widgets()
    @displayCurrentPage()