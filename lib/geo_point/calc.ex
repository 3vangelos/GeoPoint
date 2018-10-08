defmodule GeoPoint.Calc do
  @moduledoc false

  @doc """
  Multiplicator is used to convert the distance between geopoints into meters.
  Good enough explanation can be found here:
  https://stackoverflow.com/questions/3024404/transform-longitude-latitude-into-meters

  If the implementation is not accurate enough, we could also use accurate maths
  like used in the Geocalc lib: https://github.com/yltsrc/geocalc
  """
  @multiplicator 111_140

  def min(loc1, loc2), do: calc(loc1, loc2, &Enum.min/1)

  def max(loc1, loc2), do: calc(loc1, loc2, &Enum.max/1)

  def sum(loc1, loc2), do: calc(loc1, loc2, &Enum.sum/1)

  def distance(loc1, loc2) do
    loc1
    |> distance_squared(loc2)
    |> :math.sqrt()
    |> convert_to_meters()
  end

  def div(loc, divider), do: %GeoPoint{lng: loc.lng / divider, lat: loc.lat / divider}

  ##############################################################################

  defp calc(loc, nil, _), do: loc

  defp calc(loc1, loc2, f) do
    %GeoPoint{
      lng: f.([loc1.lng, loc2.lng]),
      lat: f.([loc1.lat, loc2.lat])
    }
  end

  defp distance_squared(loc1, loc2) do
    dlng = loc1.lng - loc2.lng
    dlat = loc1.lat - loc2.lat

    dlng * dlng + dlat * dlat
  end

  defp convert_to_meters(distance), do: distance * @multiplicator

end
