#!/bin/sh
if [ $# -eq 1 ] ; then
	cd $1
else
	echo "Usage: install.sh target-directory"
	echo "This script needs a target directory to avoid writing to the wrong place by accident"
	exit
fi

# pip install --upgrade pip

pyvenv-3.4 saml2test2_34-env
source saml2test2_34-env/bin/activate

# Dependencies from pysaml2

pip install --upgrade pip
pip install decorator
pip install 'requests >= 1.0.0'
pip install 'future'
pip install 'paste'
pip install 'zope.interface'

#***
# pysaml2 wants us to have repoze.who == 1.0.16 because some examples
# use the form plugin which is missing in 2.0 or newer.
# But: <= 1.0.19 has an invalid syntax, so we use the actual one
#

pip install 'repoze.who'
pip install pyasn1
pip install mako
pip install python-memcached

git clone https://github.com/mehcode/python-xmlsec.git
(
cd python-xmlsec/
python setup.py install
)

#***
# other missing dependencies

pip install pyyaml
pip install oic
pip install cherrypy

#***
# this are our "patchy" repos
#

git clone git@github.com:thomaswar/pysaml2.git
(
cd pysaml2
python setup.py install
)

git clone git@github.com:thomaswar/aatest.git
(
cd aatest
python setup.py install
)


git clone git@github.com:thomaswar/saml2test.git
(
cd saml2test
python setup.py install
)

git clone git@github.com:thomaswar/saml2test2.git
(
cd saml2test2
python setup.py install
)

git clone git@github.com:thomaswar/saml2test2_tests_examples_idp1.test.wpv.portalverbund.at.git





echo "install script finished"