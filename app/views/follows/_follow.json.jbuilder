json.extract! follow, :id, :user_id, :followed_id, :created_at, :updated_at
json.url follow_url(follow, format: :json)
