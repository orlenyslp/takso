defmodule Takso.TaxiAllocator do
    use GenServer

    def start_link(request) do
        GenServer.start_link(Takso.TaxiAllocator, request)
    end

    def init(request) do
        Process.send_after(self(), :notify_customer, 10000)
        {:ok, request}
    end

    def handle_info(:notify_customer, request) do
      Takso.Endpoint.broadcast("customer:lobby", "requests", %{msg: "Our apologies, we cannot serve your request in this moment"})
      {:noreply, request}
    end
    
end