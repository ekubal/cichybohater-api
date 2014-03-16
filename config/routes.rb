# -*- encoding : utf-8 -*-
Cichybohater::Application.routes.draw do
  resources :organizations, only: [ :index, :create, :update, :show ]

  resources :mobile, only: [ :index ]

  resources :interventions, only: [ :create, :show, :index ]

  resources :images, only: [ :show ]
end
