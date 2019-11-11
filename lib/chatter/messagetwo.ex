defmodule Chatter.MessageTwo do
  use Ecto.Schema
  import Ecto.Changeset


  schema "messages" do
    field :message, :string
    field :name, :string

    timestamps()
  end

  def recent_messages(limit \\ 10) do
    Chatter.RepoTwo.all(Chatter.MessageTwo, limit: limit)
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:name, :message])
    |> validate_required([:name, :message])
  end


end
