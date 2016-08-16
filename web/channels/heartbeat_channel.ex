defmodule PhoenixDistillery.HeartbeatChannel do
  use Phoenix.Channel

  def join("heartbeat:listen", _message, socket) do
    send(self, :after_join)
    {:ok, socket}
  end

  def handle_info(:after_join, socket) do
    send(self, {:beat, 0})
    {:noreply, socket}
  end

  def handle_info({:beat, i}, socket) do
    broadcast!(socket, "ping", %{body: i})
    Process.send_after(self, {:beat, i + 2}, 2000)
    {:noreply, socket}
  end

end
