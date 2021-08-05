defmodule Hofladen.RuntimeConfig do

  alias Hofladen.ErlHeaders.ConfigDb.Structures, as: Structs

  def start() do
    :config_db.start()
  end

  def put(%Structs.ConfigValue{} = config_value) do
    :config_db.put(Structs.to_record(config_value))
  end

  def load(name) do
    Structs.to_struct(:config_db.load(name))
  end

end