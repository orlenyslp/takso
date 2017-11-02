defmodule Takso.BookingAPIController do
    use Takso.Web, :controller
    import Ecto.Query, only: [from: 2]
    alias Takso.{Repo,Taxi}
  
    def create(conn, _params) do
      available_taxis = Repo.all(from t in Taxi, where: t.status == "available", select: t)
      if length(available_taxis) > 0 do
        taxi = List.first(available_taxis)
        put_status(conn, 201)
        |> json(%{msg: "Your taxi will arrive in 5 mins", taxi_location: taxi.location})
      else
        put_status(conn, 409)
        |> json(%{msg: "Booking request cannot be served"})
      end
    end
  end