Rails.application.routes.draw do
  # 如果是生产环境，默认开启用户注册，否则关闭
  if Rails.env.production?
    devise_for :users, :controllers => { :registrations => "registrations" }
  else
    devise_for :users
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :records
  end

  resources :records
  root 'welcome#index'

end
