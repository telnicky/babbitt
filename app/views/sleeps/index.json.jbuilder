json.array!(@sleeps) do |sleep|
  json.extract! sleep, :id, :index, :start_time, :end_time
  json.url sleep_url(sleep, format: :json)
end
