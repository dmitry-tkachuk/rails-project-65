start:
	rm -rf tmp/pids/server.pid
	bin/rails s -b 0.0.0.0

setup: install db-prepare

debug:
	bundle exec rdbg --open -n -c -- bundle exec rails s

install:
	bin/setup

db-prepare:
	bin/rails db:reset

check: test lint

test:
	bin/rails test

lint:
	bundle exec rubocop
	bundle exec slim-lint app/views/

lint-fix:
	bundle exec rubocop -A

.PHONY: test
