#!/bin/bash
# CLI Test Helper for YueScript
# Provides utility functions for testing the yue command line tool

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Test counters
TESTS_RUN=0
TESTS_PASSED=0
TESTS_FAILED=0

# Get the yue binary path
YUE_BIN="${YUE_BIN:-./bin/debug/yue}"

# Check if yue binary exists
check_yue_binary() {
    if [ ! -f "$YUE_BIN" ]; then
        echo -e "${RED}Error: yue binary not found at $YUE_BIN${NC}"
        echo "Please build the project first or set YUE_BIN environment variable"
        exit 1
    fi
    if [ ! -x "$YUE_BIN" ]; then
        echo -e "${RED}Error: yue binary is not executable${NC}"
        exit 1
    fi
}

# Assert that a command succeeds
assert_success() {
    local description="$1"
    shift
    TESTS_RUN=$((TESTS_RUN + 1))

    if "$@" > /tmp/test_stdout.txt 2> /tmp/test_stderr.txt; then
        echo -e "${GREEN}✓${NC} $description"
        TESTS_PASSED=$((TESTS_PASSED + 1))
        return 0
    else
        echo -e "${RED}✗${NC} $description"
        echo -e "  ${YELLOW}Exit code: $?${NC}"
        echo -e "  ${YELLOW}STDOUT:$(cat /tmp/test_stdout.txt)${NC}"
        echo -e "  ${YELLOW}STDERR:$(cat /tmp/test_stderr.txt)${NC}"
        TESTS_FAILED=$((TESTS_FAILED + 1))
        return 1
    fi
}

# Assert that a command fails
assert_failure() {
    local description="$1"
    shift
    TESTS_RUN=$((TESTS_RUN + 1))

    if "$@" > /tmp/test_stdout.txt 2> /tmp/test_stderr.txt; then
        echo -e "${RED}✗${NC} $description (expected failure but succeeded)"
        echo -e "  ${YELLOW}STDOUT:$(cat /tmp/test_stdout.txt)${NC}"
        echo -e "  ${YELLOW}STDERR:$(cat /tmp/test_stderr.txt)${NC}"
        TESTS_FAILED=$((TESTS_FAILED + 1))
        return 1
    else
        echo -e "${GREEN}✓${NC} $description"
        TESTS_PASSED=$((TESTS_PASSED + 1))
        return 0
    fi
}

# Assert that output contains expected string
assert_output_contains() {
    local description="$1"
    local expected="$2"
    shift 2
    TESTS_RUN=$((TESTS_RUN + 1))

    if "$@" > /tmp/test_stdout.txt 2> /tmp/test_stderr.txt; then
        if grep -qF -- "$expected" /tmp/test_stdout.txt || grep -qF -- "$expected" /tmp/test_stderr.txt; then
            echo -e "${GREEN}✓${NC} $description"
            TESTS_PASSED=$((TESTS_PASSED + 1))
            return 0
        else
            echo -e "${RED}✗${NC} $description (output doesn't contain '$expected')"
            echo -e "  ${YELLOW}STDOUT:$(cat /tmp/test_stdout.txt)${NC}"
            echo -e "  ${YELLOW}STDERR:$(cat /tmp/test_stderr.txt)${NC}"
            TESTS_FAILED=$((TESTS_FAILED + 1))
            return 1
        fi
    else
        echo -e "${RED}✗${NC} $description (command failed)"
        echo -e "  ${YELLOW}Exit code: $?${NC}"
        TESTS_FAILED=$((TESTS_FAILED + 1))
        return 1
    fi
}

# Assert that output equals expected string
assert_output_equals() {
    local description="$1"
    local expected="$2"
    shift 2
    TESTS_RUN=$((TESTS_RUN + 1))

    if "$@" > /tmp/test_stdout.txt 2> /tmp/test_stderr.txt; then
        local actual=$(cat /tmp/test_stdout.txt)
        if [ "$actual" = "$expected" ]; then
            echo -e "${GREEN}✓${NC} $description"
            TESTS_PASSED=$((TESTS_PASSED + 1))
            return 0
        else
            echo -e "${RED}✗${NC} $description (output mismatch)"
            echo -e "  ${YELLOW}Expected: '$expected'${NC}"
            echo -e "  ${YELLOW}Actual: '$actual'${NC}"
            TESTS_FAILED=$((TESTS_FAILED + 1))
            return 1
        fi
    else
        echo -e "${RED}✗${NC} $description (command failed)"
        echo -e "  ${YELLOW}Exit code: $?${NC}"
        TESTS_FAILED=$((TESTS_FAILED + 1))
        return 1
    fi
}

# Assert file exists
assert_file_exists() {
    local description="$1"
    local filepath="$2"
    TESTS_RUN=$((TESTS_RUN + 1))

    if [ -f "$filepath" ]; then
        echo -e "${GREEN}✓${NC} $description"
        TESTS_PASSED=$((TESTS_PASSED + 1))
        return 0
    else
        echo -e "${RED}✗${NC} $description (file not found: $filepath)"
        TESTS_FAILED=$((TESTS_FAILED + 1))
        return 1
    fi
}

# Print test summary
print_summary() {
    echo ""
    echo "======================================"
    echo "Test Summary"
    echo "======================================"
    echo "Total tests: $TESTS_RUN"
    echo -e "Passed: ${GREEN}$TESTS_PASSED${NC}"
    echo -e "Failed: ${RED}$TESTS_FAILED${NC}"
    echo "======================================"

    if [ $TESTS_FAILED -eq 0 ]; then
        echo -e "${GREEN}All tests passed!${NC}"
        return 0
    else
        echo -e "${RED}Some tests failed!${NC}"
        return 1
    fi
}

# Setup test environment
setup_test_env() {
    # Create temporary directory for test files
    TEST_TMP_DIR=$(mktemp -d)
    export TEST_TMP_DIR
    trap "rm -rf $TEST_TMP_DIR" EXIT
    echo "Test directory: $TEST_TMP_DIR"
}

# Get test tmp dir
get_test_tmp_dir() {
    echo "$TEST_TMP_DIR"
}

# Create a test yue file
create_test_file() {
    local filepath="$1"
    local content="$2"
    mkdir -p "$(dirname "$filepath")"
    echo "$content" > "$filepath"
}
