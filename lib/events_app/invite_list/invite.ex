defmodule EventsApp.InviteList.Invite do
  use Ecto.Schema
  import Ecto.Changeset

  schema "invites" do
    field :body, :string
    belongs_to :event, EventsApp.Events.Event
    belongs_to :user, EventsApp.Users.User

    timestamps()
  end

  @doc false
  def changeset(invite, attrs) do
    invite
    |> cast(attrs, [:body, :event_id, :user_id])
    |> validate_required([:body, :event_id, :user_id])
  end
end
