json.extract! clock_in, :id, :user_id, :sleep_duration_in_hour
json.wake_time clock_in.formated_wake_time
json.sleep_time clock_in.formated_sleep_time
json.url clock_in_url(clock_in, format: :json)
json.user do
  json.name clock_in.user.name
  json.id   clock_in.user.id
  json.url user_url(clock_in.user, format: :json)
end
