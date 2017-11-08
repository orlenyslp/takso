defmodule Takso.BookingAPIController do
    use Takso.Web, :controller
    import Ecto.Query, only: [from: 2]
    alias Takso.{Repo,Taxi}
  
    def create(conn, params) do
      available_taxis = Repo.all(from t in Taxi, where: t.status == "available", select: t)
      if length(available_taxis) > 0 do
        taxi = List.first(available_taxis)
        Takso.Endpoint.broadcast("driver:lobby", "requests", params |> Map.put(:booking_id, 1))
        Takso.TaxiAllocator.start_link(params)

        put_status(conn, 201)
        |> json(%{msg: "We are processing your request"})
      else
        put_status(conn, 409)
        |> json(%{msg: "Our apologies, we cannot serve your request in this moment"})
      end
    end
  end