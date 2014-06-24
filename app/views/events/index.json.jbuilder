json.array!(@events) do |event|
  json.extract! event, :id, :address, :endDate, :imageThumbUrl, :moreInfo, :shortDescription, :title
  json.url event_url(event, format: :json)
end
