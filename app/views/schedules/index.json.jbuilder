json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :duty_date, :duty_time, :user_id
  json.url schedule_url(schedule, format: :json)
end
