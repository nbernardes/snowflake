defmodule Snowflake.Adapter.Inline do
  use Snowflake.Adapter

  @impl true
  def startable?, do: false

  @impl true
  def next_id, do: {:ok, ts()}

  @impl true
  def machine_id, do: {:ok, ts()}

  @impl true
  def set_machine_id(id), do: {:ok, id}

  defp ts do
    System.os_time(:nanosecond) - Snowflake.Helper.epoch()
  end
end
