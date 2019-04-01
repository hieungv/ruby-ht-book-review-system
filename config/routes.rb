Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  scope "(:locale)", locale: /en|vi/ do
    root "home#index"
    as :user do
      devise_for :users, path: "", path_names: {sign_in: "login",
       sign_out: "logout", edit: "edit", sign_up: "signup"}
    end
  end
end
