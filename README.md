# lbackup_install_osx #

LBackup is an open source (GNU GPL) backup system, aimed at systems administrators who demand reliable backups.

Use this project to build the OS X package installer for LBackup.

To download a ready to install OS X package use the link below.

[![download](http://lucidsystems.tk/images/multi/download.png)](http://www.lucid.systems/download/lbackup) [![download](http://lucidsystems.tk/images/multi/apple_package.png)](http://www.lucid.systems/download/lbackup)

In order to build an OS X LBackup Apple install package follow the steps outlined below : 
 
 - Ensure that you have checked out the version of lbackup core which you wish to build : <http://github.com/henri/lbackup_core>
 - Ensure that you have installed the OS X developer tools : <http://developer.apple.com/technologies/tools/>
 - Ensure that "The Luggage" is installed on your system : <https://github.com/unixorn/luggage>
 - Ensure that the "lbackup_core" and "lbackup_install_osx" share the same parent directory. 
 - Copy the "Makefile_template" to a file called Makefile and make any necessary alterations.
 - Execute the "build.bash" script.

Further information including basic and more advanced usage is available from the following URL: 
<http://www.lbackup.org>

Instructions for installing directly from source are available from the following URL : 
<http://www.lbackup.org/source>

Comments and suggestions regarding the LBackup project and also this OS X package install process are very welcome.

