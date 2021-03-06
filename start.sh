#!/bin/bash

export MIX_ENV=prod
export PORT=4793

CFGD=$(readlink -f ~/.config/events_app)

export DATABASE_URL=ecto://events_app:mah2Ien7dae4@localhost/events_app_prod

export SECRET_KEY_BASE=vgji8dCA8XsfAmiCzMInNXng24FC0/7+GMgWv8FDixTw4Py/BWARYOGflSYJ8Ha1

_build/prod/rel/events_app/bin/events_app start
