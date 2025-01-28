json.extract! actor_photo, :id, :photo, :created_at, :updated_at
json.url actor_photo_url(actor_photo, format: :json)
json.photo url_for(actor_photo.photo)
