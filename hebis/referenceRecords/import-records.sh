#!/usr/bin/env bash

pw=${1:-xxx}
tenant=${2:-ubmz}
iln=${3:-25}
okapi=${4:-http://localhost:9130}
user=${5:-ubmz_admin}
token=$( curl -s -S -D - -H "X-Okapi-Tenant: $tenant" -H "Content-type: application/json" -H "Accept: application/json" -d '{"tenant":"'$tenant'","username":"'$user'","password":"'$pw'"}' $okapi/authn/login | grep -i "^x-okapi-token: " )

if [ $pw == "xxx" ] ; then
    echo "No password!"
    exit 1
fi

loan_type_storage_address=$okapi/loan-types
alternative_title_type_storage_address=$okapi/alternative-title-types
holdings_sources_storage_address=$okapi/holdings-sources
holdings_note_type_storage_address=$okapi/holdings-note-types
identifier_type_storage_address=$okapi/identifier-types
instance_statuses_storage_address=$okapi/instance-statuses
instance_relationship_types_storage_address=$okapi/instance-relationship-types
instance_note_type_storage_address=$okapi/instance-note-types
item_note_type_storage_address=$okapi/item-note-types
material_type_storage_address=$okapi/material-types
nature_of_content_terms_storage_address=$okapi/nature-of-content-terms

for f in ./codes2uuid-hebis-iln$iln/loan-types/*.json; do
    echo "PROCESSING -->" $f
    curl -w '\n' --http1.1 -s -X POST -D - \
         -H "Content-type: application/json" \
         -H "X-Okapi-Tenant: ${tenant}" \
	 -H "${token}" \
         -d @$f \
         "${loan_type_storage_address}" | grep 'message\|exists'
done

for f in ./codes2uuid-hebis/alternative-title-types/*.json; do
    echo "PROCESSING -->" $f
    curl -w '\n' --http1.1 -s -X POST -D - \
         -H "Content-type: application/json" \
         -H "X-Okapi-Tenant: ${tenant}" \
	 -H "${token}" \
         -d @$f \
         "${alternative_title_type_storage_address}" | grep 'message\|exists'
done

for f in ./codes2uuid-hebis/holdings-sources/*.json; do
    echo "PROCESSING -->" $f
    curl -w '\n' --http1.1 -s -X POST -D - \
         -H "Content-type: application/json" \
         -H "X-Okapi-Tenant: ${tenant}" \
	 -H "${token}" \
         -d @$f \
         "${holdings_sources_storage_address}" | grep 'message\|exists'
done

for f in ./codes2uuid-hebis/holdings-note-types/*.json; do
        echo "PROCESSING -->" $f
    	curl -w '\n' --http1.1 -s -X POST -D - \
         -H "Content-type: application/json" \
         -H "X-Okapi-Tenant: ${tenant}" \
	 -H "${token}" \
         -d @$f \
         "${holdings_note_type_storage_address}" | grep 'message\|exists'
done

for f in ./codes2uuid-hebis/identifier-types/*.json; do
    echo "PROCESSING -->" $f
    curl -w '\n' --http1.1 -s -X POST -D - \
         -H "Content-type: application/json" \
         -H "X-Okapi-Tenant: ${tenant}" \
	 -H "${token}" \
         -d @$f \
         "${identifier_type_storage_address}" | grep 'message\|exists'
done

for f in ./Additional/instance-relationship-types/*.json; do
	echo "PROCESSING -->" $f
    	curl -w '\n' --http1.1 -s -X POST -D - \
         -H "Content-type: application/json" \
         -H "X-Okapi-Tenant: ${tenant}" \
	 -H "${token}" \
         -d @$f \
         "${instance_relationship_types_storage_address}" | grep 'message\|exists'
done

for f in ./K10plus/instance-statuses/*.json; do
	echo "PROCESSING -->" $f
    	curl -w '\n' --http1.1 -s -X POST -D - \
         -H "Content-type: application/json" \
         -H "X-Okapi-Tenant: ${tenant}" \
	 -H "${token}" \
         -d @$f \
         "${instance_statuses_storage_address}" | grep 'message\|exists'
done

for f in ./codes2uuid-hebis/instance-note-types/*.json; do
        echo "PROCESSING -->" $f
    	curl -w '\n' --http1.1 -s -X POST -D - \
         -H "Content-type: application/json" \
         -H "X-Okapi-Tenant: ${tenant}" \
	 -H "${token}" \
         -d @$f \
         "${instance_note_type_storage_address}" | grep 'message\|exists'
done

for f in ./codes2uuid-hebis/item-note-types/*.json; do
        echo "PROCESSING -->" $f
    	curl -w '\n' --http1.1 -s -X POST -D - \
         -H "Content-type: application/json" \
         -H "X-Okapi-Tenant: ${tenant}" \
	 -H "${token}" \
         -d @$f \
         "${item_note_type_storage_address}" | grep 'message\|exists'
done

for f in ./codes2uuid-hebis/material-types/*.json; do
	echo "PROCESSING -->" $f
    	curl -w '\n' --http1.1 -s -X POST -D - \
         -H "Content-type: application/json" \
         -H "X-Okapi-Tenant: ${tenant}" \
	 -H "${token}" \
         -d @$f \
         "${material_type_storage_address}" | grep 'message\|exists'
done

for f in ./codes2uuid-hebis/nature-of-content-terms/*.json; do
	echo "PROCESSING -->" $f
    	curl -w '\n' --http1.1 -s -X POST -D - \
         -H "Content-type: application/json" \
         -H "X-Okapi-Tenant: ${tenant}" \
	 -H "${token}" \
         -d @$f \
        "${nature_of_content_terms_storage_address}" | grep 'message\|exists'
done
