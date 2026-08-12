#!/usr/bin/env bash
# Regenerate totem-target.svg from totem-target.yaml.
#
# precise/fast/normal are left out of the diagram on purpose: precise/fast
# carry no keys of their own worth drawing beyond e/s/d/f, and normal is a
# pure no-op layer (all &trans), so all three would just repeat the mouse
# layer's shape. All three still exist in the keymap and in this yaml --
# only the drawing skips them. keymap-drawer has no way to store that
# exclusion in the yaml or its -c config file; -s is CLI-only, hence this
# script instead of a bare `keymap draw` invocation.
set -euo pipefail
cd "$(dirname "$0")"

keymap draw totem-target.yaml \
    -s base nav num sym device fn accent mouse scroll \
    -o totem-target.svg
