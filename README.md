# Redis Cache project

Elixir project that interacts with a Redis server using the `redix` driver.

## Installation

You must have Redis installed first. Let's do it with Docker:

```sh
> docker run --name redis-server -d redis

# you can inspect your redis instance by using the following:
> docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS         PORTS      NAMES
174d8ead7860   redis     "docker-entrypoint.s…"   5 minutes ago   Up 5 minutes   6379/tcp   admiring_zhukovsky

# now my container id is 174d8ead7860 (yours will be different)
> docker exec -it 174d8ead7860 sh

# then access the client using redis-cli. The default port will be 6379

# redis-cli
127.0.0.1:6379> SET name "Manuel Menendez"
OK

# then you can consume this information by typing
127.0.0.1:6379> GET name
"Manuel Menendez"

# exit the client
127.0.0.1:6379> exit

# exit
```

Start the project:

```sh
mix deps.get
iex -S mix
```

## How to interact with this project

Open an interactive `iex` shell:

```Elixir
> iex -S mix

# if you want, you can make sure that your redis connection is alive ✅
Process.whereis(:redis_server)

# you can try some commands
Redix.command(:redis_server, ["SET", "somekey", "somevalue"])
#=> {:ok, "OK"}

Redix.command(:redis_server, ["GET", "somekey"])
#=> {:ok, "somevalue"}

# store a map
user = %{name: "some user", country: "some country", address: "some address"}

encoded_user = user |> :erlang.term_to_binary |> Base.encode16

Redix.command(:redis_server, ["SET", "user", encoded_user])

# get the map
{_, value} = Redix.command(:redis_server, ["GET", "user"])

value |> Base.decode16! |> :erlang.binary_to_term
```

You can also use the wrapper created on this project:

```Elixir
RedisCacheProject.get("user")

RedisCacheProject.set("plane", %{color: "white", capacity: 120})
RedisCacheProject.get("plane")

RedisCacheProject.delete("plane")
RedisCacheProject.get("plane") # check there's no results
```

That was very very easy 🤯. You can play a little with Redis using that way.
