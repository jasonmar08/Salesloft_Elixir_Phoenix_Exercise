defmodule WeatherWeb.WeatherView do
  use WeatherWeb, :view

  def render("index.json", %{foo: foo}) do
    %{
      "foo" => foo
    }
  end

  def render("weather.json", %{data: data}) do
    data
  end
end
