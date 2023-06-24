Rails.application.routes.draw do
  resources :clock_ins, only: %i[ show ]

  scope "/api", defaults: {format: :json} do
    resources :users, only: %i[ index show create update destroy ]

    scope "/user" do
      get       ':user_id/follows', action: :follows, controller: :follows
      post      ':user_id/follow/:followed_id', action: :follow, controller: :follows
      delete    ':user_id/unfollow/:followed_id', action: :unfollow, controller: :follows

      get       ':user_id/follow_clock_ins', action: :follow_clock_ins, controller: :clock_ins
      post      ':user_id/clock_in', action: :create, controller: :clock_ins
      get       ':user_id/clock_ins', action: :index, controller: :clock_ins
    end
  end

  match '*unmatched', to: 'application#not_found_method', via: :all
end
