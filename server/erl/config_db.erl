-module(config_db).
-export([start/0, load/1, put/1, put/2, put/3]).
-include("config_db.hrl").

start() ->
  mnesia:create_schema([node()]),
  mnesia:start(),
  mnesia:create_table(config_value, [{attributes, record_info(fields, config_value)}]).

load(Name) ->
  mnesia:transaction(
    fun() ->
      mnesia:read(config_value, Name)
    end).

put(Value) when is_record(Value, config_value) ->
  mnesia:transaction(
      fun() ->
        mnesia:write(Value)
    end).

put(Name, Value) ->
  put(Name, Value, nil).

put(Name, Value, Parent) when is_record(Parent, config_value) ->
  put(Name, Value, Parent#config_value.name);

put(Name, Value, Parent) ->
  put(#config_value{name = Name, value = Value, parent = Parent}).