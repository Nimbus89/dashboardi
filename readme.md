#Visualisation Solution
##Proposed Fourth Year Project: Paul Broughton
>During my work placement, I worked in developing a suite of visualization software. Consequently, I spent six months working with and thinking about visualisation software.
>
>Due to time and political constraints within the company, the development team was not able to use the technologeis it thought best. I intend to use the ideas I heard about from my team as well as the ideas I formed myself to create a small application for creating, editing and displaying a visualisation.

###The Concept
I intend to build, essentially, two programs. An editor, which allows a user to construct a visualisation, and a "runtime", which displays the created visualisation.

A visualisation consists of "panels" which display data and provide interactivity, and "screens" which are groups of panels arranged by the user. The user arranged panels, sets up properties of the panels, such as inputs and outputs, and creates a file which can be read by the runtime.

The visualisation should be able to take in data from a websocket and display this data in real time, depending on the inputs and panels the user has set up.

The user will be able to specify an address and port where the websocket data source is to be found. 
(I intend to create a small RNG-backed emulator to showcase the potential of the application. I intend to do this using node.js. This will be a very small amount of effort. This emulator will act as a websocket server and serve out random values using preprogrammed keys.)

Panel Examples:

- Line chart
- Nav Bar (For navagating between screens)
- Gauge
- Toggle Button

###Technologies

I intend to use Ruby on Rails, Javascript, jQuery, Handlebars and Backbone.js for the editor, and Javascript, Handlebars and Backbone.js for the runtime. In addtion, I plan to use many open-source javascript plugins and libraries in panels. For example Flot for time-series charts.

My reason for using web technologies is to provie a rich UI using the open-source resources available to web developers, e.g. JQuery UI. In addition, it is easy to make a web application seem like a desktop application using certain technologies, such as Chrome Packaged Apps. In addition, web technologies are designed to get a product up and running as fast as possible.

###Use Cases

Many companies make use of visualisations. Any automated system with a human machine interface requires some sort of visualisation to give controls and to show data in an easy-to-understand way. However, these visualisation are often either custom-made for the single use, or use extremely outdated graphics, which do not provide a good user experience.

My goal is to create a solution which allows the user to very easily create a basic visualisation program within a WYSIWYG editor.

The program should be written so as to be very maintainable, with new features being added in the form on new panels.

###Structure/Setup

- Version Control: git (github if I am allowed to go open source)
- IDEs: Sublime Text 3 for Javascript, rubymines for rails (if I can afford it, Sublime Text otherwise)
- Testing:
	- Unit: RSpec and Jasmine
	- Intergration: Selenium Chromdriver (Time Permitting)
- Pattern: Model-View-Controller (As close to a standarnd rails app as possible)
- Language Split: The application will be primarily structured in Ruby. However, some code will be needed in some locations (fopr example, the actual drag and drop of panels on screens will need to be handled with javascript. I already have some potential plugins in mind for this).
- Build system: One-step build system through Rake. This may make use of javascript tools such as grunt for linting and js unit testing.
