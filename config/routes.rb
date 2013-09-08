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
  get 'guest_book' =>               'pages#guest_book',               as: :guest_book
  get 'faq' =>                      'pages#faq',                      as: :faq
  get 'contact_us' =>               'pages#contact_us',               as: :contact_us


  resources :gifts, :path => 'registry'

  get 'register' => 'users#new', as: :register

  resources :users#, except: [:index]

  # get 'login' => 'sessions#new', as: :login
  delete 'logout/:id' => 'sessions#destroy', as: :logout

  resources :sessions, only: [:create]

  match "/auth/:provider/callback" => "sessions#create", via: :get

  resources :carts, only: [:none] do
    resources :items, shallow: true
    resources :contributions
  end


  resources :contributions, only: [:new, :create, :update] do
    member {get 'thank_you'}
  end


  namespace :admin do
    resources :users
    resources :contributions, only: :index
    resources :gifts ,only: :index
  end



end
