defmodule RetWeb.MyChannel do
  @moduledoc "Global comms channel for reticulum cluster"

  use RetWeb, :channel



  def join("my:" <> hub_sid, %{"profile" => profile, "context" => context} = params, socket) do
    {:ok, %{session_id: socket.assigns.session_id}, socket}
  end

  def handle_in("direct_message" = event, %{"type" => type} = payload, socket) do
    broadcast!(
      socket,
      event,
      payload |> Map.put(:session_id, socket.assigns.session_id) |> payload_with_from(socket)
    )
    {:noreply, socket}
  end

  defp payload_with_from(payload, socket) do
    payload |> Map.put(:from_session_id, socket.assigns.session_id)
  end


end
