defmodule EventsAppWeb.PageController do
  use EventsAppWeb, :controller

  alias EventsApp.Events
  alias EventsApp.Events.Event


  def index(conn, _params) do
    events = Events.list_events()
    render(conn, "index.html", events: events)
  end
end
