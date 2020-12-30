#!/usr/bin/env bash

set -e

# The one arg that we can accept will be the ENV we are building
export MIX_ENV=$1

echo "Starting release process..."
cd /opt/build

echo "Installing rebar and hex..."
mix local.rebar --force
mix local.hex --if-missing --force

echo "Fetching project deps..."
mix deps.get --only prod

echo "Cleaning any leftover artifacts..."
mix do clean, compile --force

echo "Building $1 release..."
# mix release $1 --overwrite
mix release 

echo "Build completed!"
exit 0