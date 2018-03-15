#!/bin/bash
#download gifs to current directory

# giphy api_key
API_KEY='Ialawd1YX6Apj02SPiSxcqeZ9qVYGE1E'

# main path
GIPHY_HOST='api.giphy.com'

function downloadRandomGif() {
  # download random gif into the current directory
  CURRENT_PATH='/v1/gifs/random'
  curl -o temp.txt "$GIPHY_HOST$CURRENT_PATH?api_key=$API_KEY&tag=$1"
  wget -O "$(jq -r '.data.title' temp.txt).gif" $(jq -r '.data.image_url' temp.txt)
  rm -f temp.txt
  unset CURRENT_PATH
}

downloadRandomGif $1
