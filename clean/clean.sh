#!/bin/sh

for target in aatest pysaml2 python-xmlsec saml2test saml2test2_34-env ; do
	echo "removing ${target}"
	if [ -d ${target} ] ; then
		rm -rf ${target}
	fi
done