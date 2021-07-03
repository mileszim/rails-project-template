#!/bin/sh

echo "RUN: bundle exec rails db:migrate"
bundle exec rails db:migrate
echo "DONE: bundle exec rails db:migrate"

echo "RUN: bundle exec rails assets:clear_cache"
bundle exec rails assets:clear_cache
echo "DONE: bundle exec rails assets:clear_cache"

echo "RUN: aws s3 asset sync"
bundle exec rails assets:sync
echo "DONE: aws s3 asset sync"
