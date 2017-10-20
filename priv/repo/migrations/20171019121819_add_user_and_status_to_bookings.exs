defmodule Takso.Repo.Migrations.AddUserAndStatusToBookings do
  use Ecto.Migration

  def change do
    alter table(:bookings) do
      add :status, :string, default: "open"
      add :user_id, references(:users)
    end
  end
end
