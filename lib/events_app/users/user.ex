defmodule EventsApp.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :photo_hash, :string
    has_many :events, EventsApp.Events.Event
    has_many :comments, EventsApp.Comments.Comment
    has_many :invites, EventsApp.InviteList.Invite
    has_many :responses, EventsApp.Responses.Response

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :photo_hash, :email])
    |> validate_required([:name, :photo_hash, :email])
  end
end
