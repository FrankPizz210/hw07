defmodule EventsApp.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :name, :string
    field :date, :string
    field :description, :string
    has_many :comments, EventsApp.Comments.Comment
    has_many :invites, EventsApp.InviteList.Invite
    has_many :responses, EventsApp.Responses.Response
    belongs_to :user, EventsApp.Users.User

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:name, :date, :description, :user_id])
    |> validate_required([:name, :date, :description, :user_id])
  end
end
