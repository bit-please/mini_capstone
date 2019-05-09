Rails.application.routes.draw do
  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/all_products_url" => "products#all_products_action"
    get "/first_product_url" => "products#first_product_method"

    get "/one_product" => "products#one_product"
    get "/one_product/:id" => "products#one_product"
  end
end
