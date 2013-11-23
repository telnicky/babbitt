json.array!(@hearts) do |heart|
  json.extract! heart, :start_time, :end_time, :bpm, :so2_sat
  json.url heart_url(heart, format: :json)
end
