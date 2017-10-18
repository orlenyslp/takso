defmodule Takso.User do
  use Takso.Web, :model

  schema "users" do
    field :name, :string
    field :username, :string
    field :password, :string
    has_many :bookings, Takso.Booking
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :username, :password])
    |> validate_required([:name, :username, :password])
  end
end
