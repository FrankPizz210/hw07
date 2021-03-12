defmodule EventsAppWeb.PageController do
  use EventsAppWeb, :controller

  alias EventsApp.Events
  alias EventsApp.Events.Event
  alias EventsApp.InviteList
  alias EventsApp.InviteList.Invite


  def index(conn, _params) do
    events = Events.list_events()
    invites = InviteList.list_invites()
    render(conn, "index.html", events: events, invites: invites)
  end
end
