json.array!(@sleeps) do |sleep|
  json.extract! sleep, :id, :integer, :datetime, :datetime
  json.url sleep_url(sleep, format: :json)
end
