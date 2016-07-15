#!/bin/sh
# installs from master
if [ $# -eq 1 ] ; then
	cd $1
else
	echo "Usage: install.sh target-directory"
	echo "This script needs a target directory to avoid writing to the wrong place by accident"
	exit
fi

get_or_update_repo() {
	(
    if [ -e $repodir ] ; then
        cd $repodir && git pull && cd -    # already cloned
    else
        mkdir -p $repodir
        git clone $repourl $repodir        # first time
    fi
		cd $repodir
		if [ -n "$repobranch" ] ; then
			git checkout -b $repobranch
		fi
		if [ -e "setup.py" ] ; then
			python setup.py install
		fi
	)
}

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
pip install 'Cython'
pip install 'lxml'

#***
# pysaml2 wants us to have repoze.who == 1.0.16 because some examples
# use the form plugin which is missing in 2.0 or newer.
# But: <= 1.0.19 has an invalid syntax, so we use the actual one
#

pip install 'repoze.who'
pip install pyasn1
pip install mako
pip install python-memcached

pip install pyyaml
pip install oic
pip install cherrypy

#***
# this are our "patchy" repos
#


repodir='install/opt/pysaml2'
repourl='https://github.com/rohe/pysaml2'
repobranch=''
get_or_update_repo

repodir='install/opt/aatest'
#repourl='https://github.com/thomaswar/aatest'
#repobranch='devel'
repourl='https://github.com/rohe/aatest'
repobranch=''
get_or_update_repo

repodir='install/opt/beaker'
repourl='https://github.com/bbangert/beaker'
repobranch=''
get_or_update_repo

repodir='saml2test2'
repourl='https://github.com/identinetics/saml2test2'
#repobranch='devel'
repobranch='rohe-ante-xfer'
get_or_update_repo

repodir='install/opt/saml2test2.conf'
repourl='https://github.com/identinetics/saml2test2_cnf_examples_test.wpv.portalverbund.at.git'
repobranch=''
get_or_update_repo

repodir='install/opt/xmldsig'
#repourl='https://github.com/identinetics/xmldsig'
repourl=https://github.com/mehcode/python-xmlsec.git
repobranch=''
get_or_update_repo





echo "install script finished"
