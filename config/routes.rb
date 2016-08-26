Rails.application.routes.draw do
  get 'notes/about'

  root 'notes#about'

  get 'people/department/:department' => 'people#index', as: :people_by_department
  get 'people/department', to: redirect('/people')
  resources :people
end
