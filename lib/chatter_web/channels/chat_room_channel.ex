defmodule ChatterWeb.ChatRoomChannel do
  use ChatterWeb, :channel

    #room_lobby's channel code
  def join("chat_room:lobby", payload, socket) do
    if authorized?(payload) do
      send(self(), :after_join)
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

    #room_two's channel code
  def join("chat_room:room_two", payload, socket) do
    if authorized?(payload) do
      send(self(), :after_join)
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end
  ## Add some nicer formatting to messages
  defp format_msg(msg) do
    %{
      name: msg.name,
      message: msg.message
    }
  end

# handle info after joining channel
  def handle_info(:after_join, socket) do
    Chatter.Message.recent_messages()
    |> Enum.each(fn msg -> push(socket, "new_message", format_msg(msg)) end)
    {:noreply, socket}
  end

  def handle_info(:after_join, socket) do
    Chatter.MessageTwo.recent_messages()
    |> Enum.each(fn msg -> push(socket, "new_message", format_msg(msg)) end)
    {:noreply, socket}
  end

  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  def handle_in("new_message", payload, socket) do
    spawn(fn -> save_message(payload) end)
    broadcast! socket, "new_message", payload
    {:noreply, socket}
  end

  def save_message(message) do
    Chatter.Message.changeset(%Chatter.Message{}, message)
      |> Chatter.Repo.insert
  end


  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
