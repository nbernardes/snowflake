defmodule Snowflake.Adapter.Inline do
  use Snowflake.Adapter

  @impl true
  def startable?, do: false

  @impl true
  def next_id, do: {:ok, random()}

  @impl true
  def machine_id, do: {:ok, random()}

  @impl true
  def set_machine_id(id), do: {:ok, id}

  defp random, do: :rand.uniform(1_000_000_000)
end
