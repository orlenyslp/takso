defmodule Takso.Geolocation do

    def trip_duration(pickup_address, dropoff_address) do
        pickup_address = String.replace(pickup_address, ",", "") |> String.replace(" ", "+")
        dropoff_address = String.replace(dropoff_address, ",", "") |> String.replace(" ", "+")
        %{body: body} = HTTPoison.get! "http://maps.googleapis.com/maps/api/distancematrix/json?origins=#{pickup_address}&destinations=#{dropoff_address}"
        %{"duration_value" => value} = Regex.named_captures ~r/duration\D+(?<duration_test>\d+ mins)\D+(?<duration_value>\d+)/, body
        Integer.parse(value) |> elem(0)
    end
end