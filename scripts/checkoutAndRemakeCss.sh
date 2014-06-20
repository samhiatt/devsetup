#!/bin/sh

CWD=`pwd`

if [ -z $1 ]
then
	echo "Usage: $0 branch_name"
	exit 0
fi


cd /prod/www/apache/htdocs/scss && git checkout $1 && make wu4_wundermap && make omnibus || {
	echo "Error checking out htdocs branch: $1. Exiting."
	cd $CWD # back to orig dir
	exit -1
}

cd /prod/www/template/omnibus && git checkout $1 || {
	echo "Error checking out template branch: $1. Exiting."
	cd $CWD # back to orig dir
    exit -1
}

echo "Done! Both templates and htdocs repos on branch $1, and css rebuilt."
cd $CWD # back to orig dir
