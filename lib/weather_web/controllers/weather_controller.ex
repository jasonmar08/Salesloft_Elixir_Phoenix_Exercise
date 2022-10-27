defmodule WeatherWeb.WeatherController do
  use WeatherWeb, :controller

  def format_weather_data(data) do
    %{} = data

    data

    # %{
    #   date: date,
    #   type: type,
    #   description: description,
    #   temperature: temp,
    #   wind: {
    #     speed: speed,
    #     bearing:
    #   },
    #   precip_prob: ,
    #   "daily": [
    #     {
    #       "date": "2018-01-23",
    #       "type": "partly-cloudy-day",
    #       "description": "Mostly cloudy throughout the day.",
    #       "temperature": {
    #         "low": 46.78,
    #         "high": 68.66
    #       }
    #   }
  end

  def index(conn, _params) do
    render(conn, "index.json", %{foo: "bar"})
  end

  def weather(conn, params) do
    lat = params["latitude"]
    lon = params["longitude"]
    api_key = System.get_env("OWM_API_KEY")

    # HTTPoison library allows to make HTTP requests
    # from server side.
    #
    # Steps I should take:
    # 0) Save token in .env file, use Envy package to retrieve it here
    # 1) Read latitude and longititude from params
    # 2) Using HTTPoison, make request to the weather API
    # 3) Prepare the response in a format that is shown in README
    # 4) Assign it to response variable

    url = "api.openweathermap.org/data/2.5/forecast?lat=#{lat}&lon=#{lon}&appid=#{api_key}"
    response = HTTPoison.get! url
    %HTTPoison.Response{body: body} = response
    parsed_body  = Jason.decode! body


    # do something with response,
    # probably need to parse JSON (use Jason package)
    #

    result = %{url: url, parsed_body: format_weather_data(parsed_body)}
    render(conn, "weather.json", data: result)
  end
end
