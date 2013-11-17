  function ApplicationController(socket){
    this.socket = socket;
    
        this.gridster = $(".visualisation").gridster({
      widget_margins: [10, 10],
      widget_base_dimensions: [140, 140]
    }).data('gridster');
    
    this.gridster.disable();
    
    this.panelFactory = new PanelFactory(this.gridster, this.socket, this);
    
    this.changePage(0);
  }
  
  ApplicationController.prototype.displayCurrentPage = function(){
    var panels = this.currentPage.panels;
    for(var i = 0; i < panels.length; i++){
      var panel = this.panelFactory.create(panels[i]);
    }
  };
  
  ApplicationController.prototype.changePage = function(pageNum){
    this.currentPage = project.pages[pageNum];
    this.gridster.remove_all_widgets();
    this.displayCurrentPage();
  };