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
  
end
