defmodule PhoenixChannelTutorial.RoomChannel do
  use Phoenix.Channel
  import Logger

  def join("rooms:lobby", auth_msg, socket) do
    {:ok, socket}
  end
  def join("rooms:" <> _private_room_id, _auth_msg, socket) do
    {:error, %{reason: "unauthorized"}}
  end

end
