defmodule Hofladen.ErlHeaders do
  require RecStruct
  import RecStruct

  defheader ConfigDb, "erl/config_db.hrl" do
    defrecstruct ConfigValue, :config_value
  end
end