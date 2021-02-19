#!/usr/bin/env python
# coding=utf-8

AUTHOR = 'Benoît Bryon'
SITENAME = 'Nos mains nues'
SITEURL = 'https://nosmainsnues.com'

PATH = 'content'
PAGE_PATHS = ['pages']
PAGE_URL = '/{slug}.html'
PAGE_SAVE_AS = '{slug}.html'
ARTICLE_PATHS = ['articles']
ARTICLE_SAVE_AS = 'articles/{slug}.html'
INDEX_SAVE_AS = 'index.html'
STATIC_PATHS = ['']
USE_FOLDER_AS_CATEGORY = False
PATH_METADATA = '(?P<slug>.*)/'
SLUGIFY_SOURCE = 'basename'

TIMEZONE = 'Europe/Paris'
DEFAULT_DATE_FORMAT = '%d %B %Y'
DEFAULT_LANG = 'fr'

THEME = 'layout'
TEMPLATE_PAGES = {
    'articles.html': 'articles/index.html',
    'formations.html': 'formations/index.html',
    'facilitation-graphique.html': 'facilitation-graphique/index.html',
}

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None

# Blogroll
LINKS = ()

# Social widget
SOCIAL = ()

DEFAULT_PAGINATION = False
