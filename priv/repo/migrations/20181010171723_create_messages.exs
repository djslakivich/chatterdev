defmodule Chatter.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :name, :string
      add :message, :string

      timestamps()
    end
  end

  def change do
    create table(:messagestwo) do
      add :name, :string
      add :message, :string

      timestamps()
    end

  end
