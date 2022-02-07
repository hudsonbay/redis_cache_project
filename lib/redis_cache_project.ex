defmodule RedisCacheProject do
  @moduledoc """
  Documentation for `RedisCacheProject`.
  """

  alias Redis.Server

  def get(key), do: Server.get(key)

  def set(key, value), do: Server.set(key, value)

  def delete(key), do: Server.delete(key)
end
