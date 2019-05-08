Rails.application.routes.draw do
  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/all_products_url" => "products#all_products_action"
    get "/first_product_url" => "products#first_product_method"
    get "/second_product_url" => "products#second_product_method"
    get "/sixth_product_url" => "products#sixth_product_method"
  end
end
