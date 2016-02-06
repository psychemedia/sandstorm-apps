#!/bin/bash
set -euo pipefail
# This script is run in the VM each time you run `vagrant-spk dev`.  This is
# the ideal place to invoke anything which is normally part of your app's build
# process - transforming the code in your repository into the collection of files
# which can actually run the service in production
#
# Some examples:
#
#   * For a C/C++ application, calling
#       ./configure && make && make install
#   * For a Python application, creating a virtualenv and installing
#     app-specific package dependencies:
#       virtualenv /opt/app/env
#       /opt/app/env/bin/pip install -r /opt/app/requirements.txt
#   * Building static assets from .less or .sass, or bundle and minify JS
#   * Collecting various build artifacts or assets into a deployment-ready
#     directory structure

# By default, this script does nothing.  You'll have to modify it as
# appropriate for your application.

sudo apt-get install -y wget unzip openjdk-7-jre-headless

if [ ! -f /opt/app/tabula/tabula.jar ]; then

	#Download tabula
	wget --no-check-certificate https://github.com/tabulapdf/tabula/releases/download/v1.0.1/tabula-jar-1.0.1.zip 

	#Unpack tabula and tidy up
	unzip tabula-jar-1.0.1.zip -d /opt/app  && rm tabula-jar-1.0.1.zip

fi

cd /opt/app
exit 0
