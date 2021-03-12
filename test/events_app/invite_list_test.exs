defmodule EventsApp.InviteListTest do
  use EventsApp.DataCase

  alias EventsApp.InviteList

  describe "invites" do
    alias EventsApp.InviteList.Invite

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def invite_fixture(attrs \\ %{}) do
      {:ok, invite} =
        attrs
        |> Enum.into(@valid_attrs)
        |> InviteList.create_invite()

      invite
    end

    test "list_invites/0 returns all invites" do
      invite = invite_fixture()
      assert InviteList.list_invites() == [invite]
    end

    test "get_invite!/1 returns the invite with given id" do
      invite = invite_fixture()
      assert InviteList.get_invite!(invite.id) == invite
    end

    test "create_invite/1 with valid data creates a invite" do
      assert {:ok, %Invite{} = invite} = InviteList.create_invite(@valid_attrs)
    end

    test "create_invite/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = InviteList.create_invite(@invalid_attrs)
    end

    test "update_invite/2 with valid data updates the invite" do
      invite = invite_fixture()
      assert {:ok, %Invite{} = invite} = InviteList.update_invite(invite, @update_attrs)
    end

    test "update_invite/2 with invalid data returns error changeset" do
      invite = invite_fixture()
      assert {:error, %Ecto.Changeset{}} = InviteList.update_invite(invite, @invalid_attrs)
      assert invite == InviteList.get_invite!(invite.id)
    end

    test "delete_invite/1 deletes the invite" do
      invite = invite_fixture()
      assert {:ok, %Invite{}} = InviteList.delete_invite(invite)
      assert_raise Ecto.NoResultsError, fn -> InviteList.get_invite!(invite.id) end
    end

    test "change_invite/1 returns a invite changeset" do
      invite = invite_fixture()
      assert %Ecto.Changeset{} = InviteList.change_invite(invite)
    end
  end
end
