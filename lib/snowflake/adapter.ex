defmodule Snowflake.Adapter do
  @callback startable? :: boolean
  @callback next_id :: {:ok, integer} | {:error, :backwards_clock}
  @callback machine_id :: {:ok, integer}
  @callback set_machine_id(integer) :: {:ok, integer}

  defmacro __using__(_) do
    quote do
      @behaviour Snowflake.Adapter

      def startable?, do: true

      defoverridable startable?: 0
    end
  end
end
