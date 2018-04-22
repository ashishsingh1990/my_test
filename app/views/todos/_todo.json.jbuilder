json.extract! todo, :id, :title, :user_id, :campaign_id, :created_at, :updated_at
json.url todo_url(todo, format: :json)
