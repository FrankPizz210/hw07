defmodule EventsAppWeb.InviteController do
  use EventsAppWeb, :controller

  alias EventsApp.InviteList
  alias EventsApp.InviteList.Invite

  def index(conn, _params) do
    invites = InviteList.list_invites()
    render(conn, "index.html", invites: invites)
  end

  def new(conn, _params) do
    changeset = InviteList.change_invite(%Invite{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"invite" => invite_params}) do
    invite_params = invite_params
    |> Map.put("user_id", current_user_id(conn))
    case InviteList.create_invite(invite_params) do
      {:ok, invite} ->
        conn
        |> put_flash(:info, "Invite created successfully.")
        |> redirect(to: Routes.event_path(conn, :show, invite.event_id))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    invite = InviteList.get_invite!(id)
    render(conn, "show.html", comment: invite)
  end

  def edit(conn, %{"id" => id}) do
    invite = InviteList.get_invite!(id)
    changeset = InviteList.change_invite(invite)
    render(conn, "edit.html", invite: invite, changeset: changeset)
  end

  def update(conn, %{"id" => id, "invite" => invite_params}) do
    invite = InviteList.get_invite!(id)

    case InviteList.update_invite(invite, invite_params) do
      {:ok, invite} ->
        conn
        |> put_flash(:info, "Invite updated successfully.")
        |> redirect(to: Routes.invite_path(conn, :show, invite))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", invite: invite, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    invite = InviteList.get_invite!(id)
    {:ok, _invite} = InviteList.delete_invite(invite)

    conn
    |> put_flash(:info, "Invite deleted successfully.")
    |> redirect(to: Routes.invite_path(conn, :index))
  end
end
