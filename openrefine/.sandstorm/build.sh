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

#Install Java dependency
sudo apt-get install -y wget unzip default-jre-headless

if [ ! -f /opt/app/openrefine-2.6-rc.2/refine ]; then

	#Download OpenRefine
	wget --no-check-certificate https://github.com/OpenRefine/OpenRefine/releases/download/2.6-rc.2/openrefine-linux-2.6-rc.2.tar.gz

	#Unpack OpenRefine and tidy up
	tar -xzf openrefine-linux-2.6-rc.2.tar.gz -C /opt/app  && rm openrefine-linux-2.6-rc.2.tar.gz

fi


#mkdir -p /var/refine
#/opt/refine/openrefine-2.6-rc.2/refine -p 8000 -i 0.0.0.0 -d /var/refine 


cd /opt/app
exit 0
