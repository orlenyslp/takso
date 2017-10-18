defmodule Takso.Booking do
  use Takso.Web, :model

  schema "bookings" do
    field :pickup_address, :string
    field :dropoff_address, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:pickup_address, :dropoff_address])
    |> validate_required([:pickup_address, :dropoff_address])
  end
end
