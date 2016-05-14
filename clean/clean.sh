#!/bin/sh

for target in aatest pysaml2 python-xmlsec saml2test saml2test2_34-env saml2test2_tests_examples_idp1.test.wpv.portalverbund.at; do
	echo "removing ${target}"
	if [ -d ${target} ] ; then
		rm -rf ${target}
	fi
done