json.extract! post, :id, :User, :blog, :comment, :created_at, :updated_at
json.url post_url(post, format: :json)