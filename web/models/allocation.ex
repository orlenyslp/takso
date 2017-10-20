defmodule Takso.Allocation do
  use Takso.Web, :model

  schema "allocations" do
    field :status, :string
    belongs_to :booking, Takso.Booking
    belongs_to :taxi, Takso.Taxi
    
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:status])
    |> validate_required([:status])
  end
end
