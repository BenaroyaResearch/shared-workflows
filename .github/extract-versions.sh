#!/bin/bash

# Extract Node version from engines field and remove >= operator
NODE_VERSION=$(cat package.json | grep -o '"node": *"[^"]*"' | cut -d'"' -f4 | sed 's/>=//g')

# Extract pnpm version from packageManager field
PNPM_VERSION=$(cat package.json | grep -o '"packageManager": *"[^"]*"' | cut -d'@' -f2 | tr -d '"')

# Output for GitHub Actions
echo "NODE_VERSION=$NODE_VERSION" >> $GITHUB_ENV
echo "PNPM_VERSION=$PNPM_VERSION" >> $GITHUB_ENV

# Also print for debugging
echo "Extracted Node.js version: $NODE_VERSION"
echo "Extracted pnpm version: $PNPM_VERSION" 
