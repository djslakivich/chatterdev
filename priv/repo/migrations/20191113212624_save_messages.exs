defmodule Chatter.Repo.Migrations.SaveMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :name, :string
      add :message, :string

      timestamps()
    end
  end
