json.extract! channelmessage, :id, :content, :from_id, :to_id, :room_id, :created_at, :updated_at
json.url channelmessage_url(channelmessage, format: :json)
