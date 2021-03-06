Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users, ActiveAdmin::Devise.config
  resources :blogs, path: :blog, only: [:index, :show]
  resources :profiles, path: :williams1, only: []
  devise_for :users, controllers: { registrations: "registrations" }
  ActiveAdmin.routes(self)
  resources :forms
  resources :syndicates
  resource :subscription
  resources :searches
  resource :card

  resources :lists, only: %i[index create update]

  namespace :lists do
    resources :investors, only: [:create, :destroy]
  end


  root "pages#home"
  get "pitchdeck" => "pages#pitchdeck"
  get "notepurchase" => "pages#notepurchase"
  get "foundersaccord" => "pages#foundersaccord"
  get "execsummary" => "pages#execsummary"
  get "convertablenote" => "pages#convertablenote"
  get "accreditedinvestor" => "pages#accreditedinvestor"
  get "resources" => "pages#resources"
  get "about" => "pages#about"
  get "lists" => "pages#lists"
  get "premium" => "pages#premium"
  get "companies" => "pages#companies"
  get "people" => "users#index"
  get "settings" => "users#edit"

  # mailbox folder routes
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

  # conversations
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end
  # resources :conversations do
  #   resources :messages
  #
  #   collection do
  #     get :inbox
  #     get :all, action: :index
  #     get :sent
  #     get :trash
  #   end
  # end


  scope '/people' do
      get "investors" => "users#investors"
  end

  resources :users, only: [:index, :show, :edit, :update, :create, :destroy], :path=>'' do
    
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
