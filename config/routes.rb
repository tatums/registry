Registry::Application.routes.draw do



  root to: 'pages#welcome'

  ##PAGES
  get 'welcome' =>                  'pages#welcome',                  as: :welcome
  get 'our_story' =>                'pages#our_story',                as: :our_story
  get 'calendar' =>                 'pages#calendar',                 as: :calendar
  get 'ceremony_and_reception' =>   'pages#ceremony_and_reception',   as: :ceremony_and_reception
  get 'wedding_party_and_family' => 'pages#wedding_party_and_family', as: :wedding_party_and_family
  get 'directions' =>               'pages#directions',               as: :directions
  get 'accommodations' =>           'pages#accommodations',           as: :accommodations
  get 'local_activities' =>         'pages#local_activities',         as: :local_activities
  get 'what_to_bring' =>            'pages#what_to_bring',            as: :what_to_bring
  get 'partners_in_crime' =>        'pages#partners_in_crime',        as: :partners_in_crime
  get 'registry' =>                 'pages#registry',                 as: :registry
  get 'guest_book' =>               'pages#guest_book',               as: :guest_book
  get 'faq' =>                      'pages#faq',                      as: :faq
  get 'contact_us' =>               'pages#contact_us',               as: :contact_us



  resources :gifts

  get 'register' => 'users#new', as: :register
  resources :users, except: :new

  get 'login' => 'sessions#new', as: :login
  delete 'logout/:id' => 'sessions#destroy', as: :logout

  resources :sessions, only: [:create]







  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
