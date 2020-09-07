defmodule KV.RouterTest do
  use ExUnit.Case, async: true

  setup_all do
    current = Application.get_env(:kv, :routing_table)

    Application.put_env(:kv, :routing_table, [
      {?a..?m, :"foo@DESKTOP-QH2MENT"},
      {?n..?z, :"bar@DESKTOP-QH2MENT"}
    ])

    on_exit fn -> Application.put_env(:kv, :routing_table, current) end
  end

  @tag :distributed
  test "route request across nodes" do
    assert KV.Router.route("hello", Kernel, :node, []) == :"foo@DESKTOP-QH2MENT"

    assert KV.Router.route("world", Kernel, :node, []) == :"bar@DESKTOP-QH2MENT"
  end

  test "raises on unknown entries" do
    assert_raise RuntimeError, ~r/Could not find entry/, fn ->
      KV.Router.route(<<0>>, Kernel, :node, [])
    end
  end
end
