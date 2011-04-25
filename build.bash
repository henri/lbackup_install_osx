#!/bin/bash

# Script to build OS X package install from lbackup core source code
#
# Copyright (C)2011 - Henri Shustak
# Released under the GUN GPL v3 or later
#
# Ensure that the parent directory contatins the lbackup_core source code directory

# various varibles
tmp_build_file=`mktemp /tmp/lbackup_core.tar.gz.XXXXXXXXX`
rm "${tmp_build_file}"
output_lbackup_core_tar_archive_name="lbackup_core.tar.gz"
input_lbackup_core_directory_name="lbackup_core"
osx_installer_output_directory="./"
relaitive_parent_directory_contianing_lbackup_core_source="../"
script_directory=`dirname "${0}"`
excludes_file_name="exclude.txt"

output_tar_file_absolute_path="${script_directory}/${output_lbackup_core_tar_archive_name}"
excludes_file_absolute_path="${script_directory}/${excludes_file_name}"

output_package_file_name="LBackup.pkg"
output_lbackup_core_unpack_file_name="lbackup_core"

# check we are running as root
current_user=`whoami`
if [ "${current_user}" != "root" ] ; then 
    echo ""
    echo "    ERROR! : This build script must be run as root."
    echo ""
    exit -1
fi

# move to directory containing lbackup core source code direcotry
cd "${script_directory}"

# if a previous archvie exits then remove this
if [ -f "${output_tar_file_absolute_path}" ] ; then 
    rm "${output_tar_file_absolute_path}"
    if [ $? != 0 ] ; then
        echo ""
        echo "    ERROR! : Failed during old tarball removal."
        echo ""
        exit -1
    fi
fi

# if a previous unpack of the archive exits then remove this
if [ -d "${output_lbackup_core_unpack_file_name}" ] ; then 
    rm -R "${output_lbackup_core_unpack_file_name}"
    if [ $? != 0 ] ; then
        echo ""
        echo "    ERROR! : Failed during old lbackup core unpack removal."
        echo ""
        exit -1
    fi
fi

# if a previous packge exits then remove this
if [ -e "${output_package_file_name}" ] ; then 
    rm -R "${output_package_file_name}"
    if [ $? != 0 ] ; then
        echo ""
        echo "    ERROR! : Failed during old package removal."
        echo ""
        exit -1
    fi
fi
 

# tar the backup core using the excludes file (to remove various parts)
cd "${relaitive_parent_directory_contianing_lbackup_core_source}"
tar -czvf "${output_tar_file_absolute_path}" -X "${excludes_file_absolute_path}" "${input_lbackup_core_directory_name}" 
if [ $? != 0 ] ; then
    echo ""
    echo "    ERROR! : Failed during new tarball creation."
    echo ""
    exit -1
fi
cd "${script_directory}"

# If a previous package exits then remove this

# make the pacakge using the luggage
make pkg
if [ $? != 0 ] ; then
    echo ""
    echo "    ERROR! : Failed during new package creation."
    echo ""
    exit -1
fi

echo ""
echo "---------------------------------------------------------------------------------"
echo " Package for LBackup was successfully created from the LBackup core source code. "
echo "---------------------------------------------------------------------------------"
echo ""

exit 0

