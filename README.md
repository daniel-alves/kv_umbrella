# KvUmbrella

**Aplicativo do tutorial de elixir é um aplicativo de armazenamento chave - valor distribuido é possível executar 2 nodes na mesma máquina nodes em maquina distintas**

#### Para abrir o iex no windows
`iex.bat --sname foo --werl -S mix`

`iex.bat --sname bar --werl -S mix`

#### Para executar os teste
`mix test`

#### Para gerar as releases
`mix release foo`

`mix release bar`

#### Após gerar as releases, para executar os 2 nodes em windows
**Node foo**

`> $MIX_ENV="prod"`
`> _build/prod/rel/foo/bin/foo start`

**Node bar**

`> $MIX_ENV="prod"`
`> _build/prod/rel/bar/bin/bar start`

#### Para testar 
abra o telnet connect em 127.0.0.1(ou IP da maquina que esta rodando o kv_server) na porta 4040

**Comandos possíveis**

`CREATE shopping`

`OK`

`PUT shopping milk 1`

`OK`

`PUT shopping eggs 3`

`OK`

`GET shopping milk`

`1`

`OK`

`DELETE shopping eggs`

`OK`