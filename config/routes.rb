Rails.application.routes.draw do
  resources :blogs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
#I think a route is a path that the program can take.  For example, if you select edit and a new page opens up or if you hit back.  This line "resources :blogs" handels all of the routes for the blog.
#Resources is a word that encapsulates all of the popular routes that applications use.
