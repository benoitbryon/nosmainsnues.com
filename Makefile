# Reference card for usual actions in development environment.
#
# For standard installation, see INSTALL.
# For details about development environment, see CONTRIBUTING.rst.
#

# Directories.
BASEDIR = $(CURDIR)
INPUTDIR = $(BASEDIR)/content
OUTPUTDIR = $(BASEDIR)/public
CONFFILE = $(BASEDIR)/pelicanconf.py
PUBLISHCONF = $(BASEDIR)/publishconf.py

# Executables.
GHP ?= ghp-import
GORUN ?= gorun.py
PELICAN ?= pelican
PELICANOPTS =
PIP ?= pip
PY ?= python
WEBPACK ?= npx webpack
YARN ?= yarn


#: help - Display available targets.
.PHONY: help
help:
	@echo "Reference card for usual actions in development environment."
	@echo "Here are available targets:"
	@egrep -o "^#: (.+)" [Mm]akefile  | sed 's/#: /* /'


#: develop - Install development libraries.
.PHONY: develop
develop:
	$(YARN) --verbose
	$(PIP) install -r requirements.pip


#: watch - Watch in-development files and automatically build them on update.
.PHONY: watch
watch:
	$(GORUN)


#: html - Generate HTML files in public/ folder.
.PHONY: html
html:
	mkdir -p content
	$(PELICAN) $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS)


#: assets - Generate CSS files in public/ folder.
.PHONY: assets
assets:
	$(WEBPACK) --config=webpack-config.js


#: media - Generate public/img/
.PHONY: img
img:
	mkdir -p public/assets/img
	rsync -r --progress assets/img/ public/assets/img/


#: public - Generate public/ folder contents.
.PHONY: public
public: html img assets


#: serve - Serve public/ folder on localhost:8000
.PHONY: serve
serve:
	cd public/ && python -m SimpleHTTPServer


#: clean - Basic cleanup, mostly temporary files.
.PHONY: clean
clean:


#: distclean - Remove local builds
.PHONY: dist-clean
dist-clean: clean
	rm -rf public/


#: maintainer-clean - Remove almost everything that can be re-generated.
.PHONY: maintainer-clean
maintainer-clean: dist-clean
	rm -rf node_modules/


#: gh-pages-commit - Commit generated website into gh-pages branch.
.PHONY: gh-pages-commit
gh-pages-commit:
	cp CNAME public/
	$(GHP) -n public/


# gh-pages-push - Travis pushes gh-pages branch on Github.
.PHONY: gh-pages-push
gh-pages-push:
	@git push -fq https://${GH_TOKEN}@github.com/$(TRAVIS_REPO_SLUG).git gh-pages > /dev/null
