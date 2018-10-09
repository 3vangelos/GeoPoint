defmodule GeoPoint.Create do
  @moduledoc false

  def from(string) when is_bitstring(string) do
    string
    |> String.split(",")
    |> Enum.map(&String.to_float/1)
    |> from()
  end

  def from([latitude, longitude]) do
    %GeoPoint{lat: latitude, lng: longitude}
  end

  def from(%{"lat" => lat, "lng" => lng}) do
    %GeoPoint{lat: lat, lng: lng}
  end

  def from(_), do: nil

end
