Rails.application.routes.draw do

  scope "/api", defaults: {format: :json} do
    resources :users, only: %i[ index show create update destroy ]

    scope "/user" do
      get       ':user_id/follows', action: :follows, controller: :follows
      post      ':user_id/follow/:followed_id', action: :follow, controller: :follows
      delete    ':user_id/unfollow/:followed_id', action: :unfollow, controller: :follows
    end
  end

  match '*unmatched', to: 'application#not_found_method', via: :all
end
