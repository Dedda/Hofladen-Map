defmodule Hofladen.RuntimeConfig do
  use Amnesia

  defdatabase ConfigDatabase do
    deftable ConfigValue, [:name, :value, :parent_id] do
      def parent(self) do
        ConfigValue.read(self.parent_id)
      end
    end
  end

  def start do
    Amnesia.stop()
    Amnesia.Schema.create()
    Amnesia.start()
    Hofladen.RuntimeConfig.ConfigDatabase.create()
  end

  def read(name) do
    Amnesia.transaction do
      ConfigValue.read(name)
    end
  end

  def put(name, value) do
    put(name, value, nil)
  end

  def put(name, value, %ConfigDatabase.ConfigValue{} = parent) do
    Amnesia.transaction do
      ConfigValue.write(%ConfigDatabase.ConfigValue{
        name: name,
        value: value,
        parent_id: parent.name,
      })
    end
  end

  def parent(nil) do
    nil
  end

  def parent(config_value) do
    Amnesia.transaction do
      config_value
      |> ConfigValue.parent()
    end
  end
end