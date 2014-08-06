Rails.application.routes.draw do

  root 'program#index'
  get 'now' => 'now#view'
 
end
