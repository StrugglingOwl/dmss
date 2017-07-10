Rails.application.routes.draw do
  # 如果是正式环境（production为正式环境，development为开发模式，test为测试模式），关闭用户注册，否则开启
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
