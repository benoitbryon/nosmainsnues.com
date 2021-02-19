.PHONY: develop public serve distclean

# Setup development environment
develop:
	docker-compose build statics-builder
	docker-compose run --rm statics-builder yarn install
	docker-compose build content-builder
	docker-compose run --rm content-builder pipenv install

# Generate static site
public:
	mkdir -p public
	docker-compose run --rm content-builder pipenv run pelican -o public
	docker-compose run --rm statics-builder yarn run parcel build --no-content-hash --out-dir=public assets/css/main.scss assets/js/main.js
	cp -r assets/img public/


# Run web server for development
serve:
	cd public && python -m SimpleHTTPServer


# Delete what can be rebuilt.
distclean:
	rm -rf .cache node_modules
	rm -rf .venv
	docker-compose rm
