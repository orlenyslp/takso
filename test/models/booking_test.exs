defmodule Takso.BookingTest do
  use Takso.ModelCase

  alias Takso.Booking

  @valid_attrs %{dropoff_address: "some dropoff_address", pickup_address: "some pickup_address"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Booking.changeset(%Booking{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Booking.changeset(%Booking{}, @invalid_attrs)
    refute changeset.valid?
  end
end
