OpenVisu::Application.routes.draw do

  root to: 'application#welcome'

  resources :panel_types
  resources :data_sources
  resources :pages
  resources :panels
  devise_for :users

  resources :projects do
    resources :comparison_functions
    resources :combination_functions
    resources :mapping_functions
  end

  get "sse/oldRandom/", to: "sse#oldRandom"
  get "sse/random/:project_id", to: "sse#random"
  get "sse/ping/:source_id", to: "sse#ping"

  get "websocket/rand3"
  
  get "help", to: "help#index"
  get "help/projects", to: "help#projects"
  get "help/pages", to: "help#pages"
  get "help/sources", to: "help#sources"
  get "help/functions", to: "help#functions"
  get "help/editor", to: "help#editor"
  get "help/panels", to: "help#panels"



end
