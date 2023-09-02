#!/bin/bash

set -eu

declare -r KAL_HOME='/tmp/kal-toolchain'

if [ -d "${KAL_HOME}" ]; then
	PATH+=":${KAL_HOME}/bin"
	export KAL_HOME \
		PATH
	return 0
fi

declare -r KAL_CROSS_TAG="$(jq --raw-output '.tag_name' <<< "$(curl --retry 10 --retry-delay 3 --silent --url 'https://api.github.com/repos/AmanoTeam/Kal/releases/latest')")"
declare -r KAL_CROSS_TARBALL='/tmp/kal.tar.xz'
declare -r KAL_CROSS_URL="https://github.com/AmanoTeam/Kal/releases/download/${KAL_CROSS_TAG}/x86_64-unknown-linux-gnu.tar.xz"

curl --connect-timeout '10' --retry '15' --retry-all-errors --fail --silent --location --url "${KAL_CROSS_URL}" --output "${KAL_CROSS_TARBALL}"
tar --directory="$(dirname "${KAL_CROSS_TARBALL}")" --extract --file="${KAL_CROSS_TARBALL}"

rm "${KAL_CROSS_TARBALL}"

mv '/tmp/kal' "${KAL_HOME}"

PATH+=":${KAL_HOME}/bin"

export KAL_HOME \
	PATH
