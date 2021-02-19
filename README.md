# NosMainsNues.com

This is the code repository for nosmainsnues.com website,
including both content and theme.

Typical development/build environment requires:

* docker-compose
* make
* Python
* Git

Typical workflow:

* Clone the repository: git clone git@github.com:benoitbryon/nosmainsnues.git
* Go to repository folder: cd nosmainsnues
* Install build tools: make develop
* Generate public files: make public
* Run web service for generated files: make serve
* Open public/index.html: firefox http://localhost:8000/
