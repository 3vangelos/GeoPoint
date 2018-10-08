defmodule GeoPoint do
  @moduledoc """
  Struct to save a GeoPoint with basic calc functions

  ## Examples

      iex> GeoPoint.min( %GeoPoint{lng: 1.2, lat: 2.2}, %GeoPoint{lng: 1.5, lat: 0.2} )
      %GeoPoint{lat: 0.2, lng: 1.2}

      iex> position = GeoPoint.max( %GeoPoint{lng: 1.2, lat: 2.2}, %GeoPoint{lng: 1.5, lat: 0.2} )
      %GeoPoint{lat: 2.2, lng: 1.5}

  """

  alias __MODULE__.Calc
  alias __MODULE__.Create

  @enforce_keys [:lng, :lat]
  defstruct [:lng, :lat]
  @type t :: %__MODULE__{lng: float, lat: float}


  @doc """
  Create GeoPoint from String
  Returns %GeoPoint
  """
  @spec from(String) :: t()
  defdelegate from(string), to: Create

  @doc """
  Creates a GeoPoint from a List
  Returns %GeoPoint
  """
  @spec from(nonempty_list(Float)) :: t()
  defdelegate from(list), to: Create

  @doc """
  Calculates the min Latitude and min Longitude of two GeoPoints
  Returns %GeoPoint
  """
  @spec min(t(), t()) :: t()
  defdelegate min(loc1, loc2), to: Calc

  @doc """
  Calculates the max Latitude and max Longitude of two GeoPoints
  Returns %GeoPoint
  """
  @spec max(t(), t()) :: t()
  defdelegate max(loc1, loc2), to: Calc

  @doc """
  Sums the Latitudes and the Longitudes of two GeoPoints
  Returns %GeoPoint
  """
  @spec sum(t(), t()) :: t()
  defdelegate sum(loc1, loc2), to: Calc

  @doc """
  Calculates the distance between two GeoPoint in meters
  Returns Float
  """
  @spec distance(t(), t()) :: float()
  defdelegate distance(loc1, loc2), to: Calc

  @doc """
  Divides the Latitudes and the Longitudes by the divider
  Returns %GeoPoint
  """
  @spec div(t(), non_neg_integer()) :: t()
  defdelegate div(loc, divider), to: Calc
end
