# Installer and config for saml2test2

## What:

This project supplies scripts to help you set up saml2test2

## Fast start

1. Create a directory for the installation
2. Make sure you have git installed
3. Run the script (see below) with that directory as a parameter
4. If the script fails, it should be because of a missing development library in your system
5. Install missing libraries and repeat running the script
6. Download a configuration packet (see below)
7. Run the tests

## Running the script

There are several scripts provided to install different versions of saml2test2.

### install_thowar.sh 

installs saml2test2 using the thowar development forks master branches. As an User, this is what you want.

### install_thowar_devel.sh installs saml2test using the (hopefully) most actual
bleeding-edge development forks (non-master) branches. 

## Configuration Package

This should grow into a list of ready-to-use configuration packages where you can test your setup or
start configuration.

### test.wpv.portalverbund.at

[github link](https://github.com/thomaswar/saml2test2_tests_examples_idp1.test.wpv.portalverbund.at)

## Something is not working?

Take a look into the script, it is pretty straight forward, and create an issue on github.

