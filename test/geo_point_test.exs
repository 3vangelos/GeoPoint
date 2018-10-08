defmodule GeoPointTest do
  use ExUnit.Case
  doctest GeoPoint

  test "create GeoPoint" do
    point = %GeoPoint{lat: 1.0, lng: 2.0}
    assert point.lat == 1.0
    assert point.lng == 2.0
  end

  test "create GeoPoint from String" do
    point = GeoPoint.from("1.0,2.0")
    assert point.lat == 1.0
    assert point.lng == 2.0
  end

  test "create GeoPoint from List" do
    point = GeoPoint.from([1.0,2.0])
    assert point.lat == 1.0
    assert point.lng == 2.0
  end

  test "calculate Min of Points" do
    point1 = %GeoPoint{lat: 1.0, lng: 2.0}
    point2 = %GeoPoint{lat: 2.0, lng: 1.0}
    point = GeoPoint.min(point1, point2)
    assert point.lat == 1.0
    assert point.lng == 1.0
  end

  test "calculate Max of Points" do
    point1 = %GeoPoint{lat: 1.0, lng: 2.0}
    point2 = %GeoPoint{lat: 2.0, lng: 1.0}
    point = GeoPoint.max(point1, point2)
    assert point.lat == 2.0
    assert point.lng == 2.0
  end

  test "sum of two Points" do
    point1 = %GeoPoint{lat: 1.0, lng: 2.0}
    point2 = %GeoPoint{lat: 2.0, lng: 1.0}
    point = GeoPoint.sum(point1, point2)
    assert point.lat == 3.0
    assert point.lng == 3.0
  end

  test "distance between two Points" do
    point1 = %GeoPoint{lat: 2.0, lng: 2.0}
    point = GeoPoint.div(point1, 2)
    assert point.lat == 1.0
    assert point.lng == 1.0
  end
end
