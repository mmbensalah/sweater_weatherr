class WeatherSerializer
  include FastJsonapi::ObjectSerializer

  attributes :forecast,
             :current_temp,
             :feels_like,
             :current_time,
             :humidity,
             :visibility ,
             :uv,
             :current_summary,
             :hourly,
             :daily
end
