#!/bin/bash

export MIX_ENV=prod
# Common port range for this is 4000-10,000
# Valid port range for a user app to listen
# on is something like 1025-32767
export PORT=4793
export SECRET_KEY_BASE=vgji8dCA8XsfAmiCzMInNXng24FC0/7+GMgWv8FDixTw4Py/BWARYOGflSYJ8Ha1
export DATABASE_URL=ecto://events_app:mah2Ien7dae4@localhost/events_app_prod

mix deps.get --only prod
mix compile

CFGD=$(readlink -f ~/.config/events_app)

mix ecto.migrate

npm install --prefix ./assets
npm run deploy --prefix ./assets
mix phx.digest

mix release
