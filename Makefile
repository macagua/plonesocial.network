default: buildout test

buildout: bin/buildout buildout-cache/downloads
	bin/buildout -c buildout.cfg -N -t 3

test:
	bin/test
	bin/flake8 plonesocial

bin/buildout: bin/python
	bin/python bootstrap.py

bin/python:
	virtualenv --clear --no-site-packages --setuptools --python=python2.7 .

buildout-cache/downloads:
	[ -d buildout-cache ] || mkdir -p buildout-cache/downloads

clean:
	rm -rf bin/* .installed.cfg parts/download

