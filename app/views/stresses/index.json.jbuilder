json.array!(@stresses) do |stress|
  json.extract! stress, :id, :integer, :datetime, :datetime
  json.url stress_url(stress, format: :json)
end
