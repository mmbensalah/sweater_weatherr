class WeatherSerializer
  include FastJsonapi::ObjectSerializer
  set_id     :location
  attributes :forecast,
             :current_temp,
             :feels_like,
             :current_time,
             :humidity,
             :visibility ,
             :uv,
             :current_summary,
             :hourly_summary,
             :daily_summary,
             :hourly,
             :daily
end
