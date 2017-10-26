defmodule Takso.GeolocationTest do
    use ExUnit.Case
    import Mock

    alias Takso.Geolocation

    test "Call to Google API" do
        with_mock HTTPoison, [get!: fn(_url) -> 
            %HTTPoison.Response{body: File.read! "liivi_to_raatuse.json" } end] do
            duration = Geolocation.trip_duration("Liivi 2, Tartu", "Raatuse 22, Tartu")
            assert called HTTPoison.get! "http://maps.googleapis.com/maps/api/distancematrix/json?origins=Liivi+2+Tartu&destinations=Raatuse+22+Tartu"
            assert duration == 379
        end
    end
end