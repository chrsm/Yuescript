#!/bin/bash
# Test Basic Options for YueScript CLI
# Tests: -h, --help, -v, --version

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/cli_test_helper.sh"

# Check binary
check_yue_binary

echo "========================================"
echo "Testing Basic Options"
echo "========================================"
echo ""

# Test 1: Help flag -h
echo "Testing -h flag..."
assert_output_contains "Help flag -h should show usage" "Usage: yue" $YUE_BIN -h

# Test 2: Help flag --help
assert_output_contains "Help flag --help should show usage" "Usage: yue" $YUE_BIN --help

# Test 3: Version flag -v
assert_output_contains "Version flag -v should show version" "Yuescript version:" $YUE_BIN -v

# Test 4: Version flag --version
assert_output_contains "Version flag --version should show version" "Yuescript version:" $YUE_BIN --version

# Test 5: Verify help contains expected sections
echo ""
echo "Testing help content..."
# Use grep -F to search for fixed strings without interpreting special characters
assert_output_contains "Help should show compile options" "output-to" $YUE_BIN --help
assert_output_contains "Help should show minify option" "minify" $YUE_BIN --help
assert_output_contains "Help should show execute option" "execute" $YUE_BIN --help

echo ""
print_summary
