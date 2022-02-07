defmodule Redis.Server do
  @conn :redis_server

  def set(key, value) do
    encoded_value =
      value
      |> :erlang.term_to_binary()
      |> Base.encode16()

    Redix.command(@conn, ["SET", key, encoded_value])
  end

  def get(key) do
    @conn
    |> Redix.command(["GET", key])
    |> get_info()
  end

  def delete(key), do: Redix.command(@conn, ["DEL", key])

  defp get_info({:ok, nil}), do: {:not_found, "Key not found"}
  defp get_info({:ok, value}), do: value |> Base.decode16!() |> :erlang.binary_to_term()
end
