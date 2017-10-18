defmodule Takso.BookingController do
    use Takso.Web, :controller

    import Ecto.Query, only: [from: 2]
    alias Takso.{Booking, Taxi, Repo}
  
    def new(conn, _params) do
      changeset = Booking.changeset(%Booking{})
      render(conn, "new.html", changeset: changeset)
    end

    def create(conn, _params) do
      available_taxis = Repo.all(from t in Taxi, where: t.status == "available", select: t)
      if length(available_taxis) > 0 do
        conn
        |> put_flash(:info, "Your taxi will arrive in 5 minutes")
        |> redirect(to: booking_path(conn, :index))
      else
        conn
        |> put_flash(:error, "Sorry, there are not available taxis in this moment")
        |> redirect(to: booking_path(conn, :index))
      end
    end

    def index(conn, _params) do
      render conn, "index.html"
    end


  end