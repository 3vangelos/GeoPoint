defmodule GeoPoint.Create do

  def from(string) when is_bitstring(string) do
    String.split(string, ",")
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
