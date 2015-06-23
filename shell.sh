#!/bin/sh
puppet_modules="vamsee-solr puppetlabs-postgresql"

for m in `echo ${puppet_modules}`;
do 
	ind=`puppet module list | grep ${m} | wc -l`

	if [ "${ind}" -eq "0" ]
	then
		puppet module install ${m} 
	fi;
done;

