Rails.application.routes.draw do

  resources :admins
  resources :rentals do
    resources :reservations
  end
  get 'home/index'
  root :to => "home#index"

  get 'apibooking/',to: 'apibooking#getRentalAll'
  get 'apibooking/getRentalAll',to: 'apibooking#getRentalAll'
  get 'apibooking/getRental/:id',to: 'apibooking#getRental'
  get 'apibooking/index/:id', to: 'apibooking#index'
  get 'apibooking/delRental/:id', to: 'apibooking#delRental'
  match 'apibooking/addRental', to: 'apibooking#addRental', via: [:get, :post] #:rental_params

  get 'apibooking/:rental_id/delReservation/:reserv_id',to: 'apibooking#delReservation'
  get 'apibooking/:id/getReservations',to: 'apibooking#getReservations'
  match 'apibooking/addReservation', to: 'apibooking#addReservation', via: [:get, :post] #:reservation_params,:rental_id

  match 'apibooking/getAdmins' => 'apibooking#getAdmins', via: [:get, :post]
  match 'apibooking/checkAdmin' => 'apibooking#checkAdmin', via: [:get, :post]  #:email , :password

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
