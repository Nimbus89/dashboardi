//= require_tree ../../app/assets/javascripts/visualisation

var sample_project_json = {
	startpage_id:0,
	data_sources:[],
	mapping_functions:[],
	comparison_functions:[],
	combination_functions:[],
	screensize_x:0,
	screensize_y:0,
	pages: {0:{panels:[], id:0},1:{panels:[{test:123}], id:1}}
};

var sample_websocket_message = {
	data: '{"key": "123","value": "123"}'
};

var sample_sse_message = '{"key":"123", "val":123}';

describe("The ApplicationController Class", function() {

  var project;

  beforeEach(function(){
    project = new window.ApplicationController(sample_project_json);
  });

  it("can be constructed", function() {
    new window.ApplicationController(sample_project_json);
  });
  it("has an error handler", function(){
  	expect(project.eHandler).not.toBeUndefined();
  	expect(project.eHandler).not.toBeNull();
  });
  it("has a socket", function(){
  	expect(project.socket).not.toBeUndefined();
  	expect(project.socket).not.toBeNull();
  });
  it("has a function controller", function(){
  	expect(project.funcCont).not.toBeUndefined();
  	expect(project.funcCont).not.toBeNull();
  });
  it("has a panel factory", function(){
  	expect(project.panelFactory).not.toBeUndefined();
  	expect(project.panelFactory).not.toBeNull();
  });
  it("can change pages", function(){
  	spyOn(project, "displayCurrentPage");
  	expect(project.currentPage.id).toBe(0);
  	project.changePage(1);
  	expect(project.currentPage.id).toBe(1);
  	expect(project.displayCurrentPage).toHaveBeenCalled();
  });
  it("makes calls to panel factory", function(){
  	spyOn(project.panelFactory, "create");
  	project.changePage(1);
  	expect(project.panelFactory.create).toHaveBeenCalled();
  });

});

describe("The Socket Class", function(){
	var socket;

	var stubSubscriber;

	beforeEach(function(){
		var stubEHandler = {handle: jasmine.createSpy("handle")};

		stubSubscriber = {update: jasmine.createSpy("update")};
		socket =  new window.Socket(sample_project_json,stubEHandler);
	});

	it("can be constructed", function(){
		var stubEHandler = {handle: jasmine.createSpy("handle")};
		new window.Socket(sample_project_json,stubEHandler);
	});

	it("can add a subscriber", function(){
		expect(socket.subscriptions["123"]).toBeUndefined();
		socket.add_subscription("123", stubSubscriber);
		expect(socket.subscriptions["123"]).not.toBeUndefined();
	});

	it("can handle websocket messages", function(){
		socket.add_subscription("123", stubSubscriber);
		socket.process_websocket_message(sample_websocket_message);
		expect(stubSubscriber.update).toHaveBeenCalled();
	});

	it("can handle SSE messages", function(){
		socket.add_subscription("123", stubSubscriber);
		socket.process_sse_message(sample_sse_message);
		expect(stubSubscriber.update).toHaveBeenCalled();
	});

	it("can handle direct triggers", function(){
		socket.add_subscription("123", stubSubscriber);
		socket.trigger_callbacks("123", "123");
		expect(stubSubscriber.update).toHaveBeenCalled();
	});

});

describe("The ErrorHandler Class", function(){
	var handler;

	beforeEach(function(){
		handler = new window.ErrorHandler();
	});

	it("can be consturcted", function(){
		new window.ErrorHandler();
	});
	it("creates a purr message", function(){
		handler.handle("Hello.");
		expect($(".purr").size).not.toBe(0);
	});
});

describe("The FunctionController Class", function(){

});

describe("The PanelFactory Class", function(){

});