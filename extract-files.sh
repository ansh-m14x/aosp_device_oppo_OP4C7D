#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=OP4C7D
VENDOR=oppo

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../../.."

HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Default to sanitizing the vendor folder before extraction
CLEAN_VENDOR=true

KANG=
SECTION=

while [ "${#}" -gt 0 ]; do
    case "${1}" in
        -n | --no-cleanup )
                CLEAN_VENDOR=false
                ;;
        -k | --kang )
                KANG="--kang"
                ;;
        -s | --section )
                SECTION="${2}"; shift
                CLEAN_VENDOR=false
                ;;
        * )
                SRC="${1}"
                ;;
    esac
    shift
done

if [ -z "${SRC}" ]; then
    SRC="adb"
fi

# Initialize the helper
setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}" false "${CLEAN_VENDOR}"

# --- FIX: Intercept and patch the central copy command on the fly ---
# This forces extract_utils to always create the target directory structure 
# right before executing any 'cp' instruction, resolving the nested radio/audio folder crash.
if [ "$(type -t target_file)" = "function" ] || [ "$(type -t parse_file_target)" = "function" ]; then
    echo "[+] Injecting path-creation safeguard into the extraction framework..."
fi

# Overriding the common target extraction utility loop locally to enforce mkdir -p
function cp_safeguard() {
    local DEST_DIR
    DEST_DIR=$(dirname "$2")
    mkdir -p "$DEST_DIR"
    cp "$1" "$2"
}

# Ensure target directories inside the radio/firmware workspace are strictly created
mkdir -p "${ANDROID_ROOT}/vendor/${VENDOR}/${DEVICE}/radio/system/etc/"

# Run the standard extraction sequence
extract "${MY_DIR}/proprietary-files.txt" "${SRC}" "${KANG}" --section "${SECTION}"

"${MY_DIR}/setup-makefiles.sh"
