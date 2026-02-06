#!/bin/bash
# Main test runner for YueScript CLI
# Runs all CLI test suites

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}======================================"
echo "YueScript CLI Test Suite"
echo "======================================${NC}"
echo ""

# Check if yue binary exists
YUE_BIN="${YUE_BIN:-./bin/debug/yue}"
if [ ! -f "$YUE_BIN" ]; then
    echo -e "${RED}Error: yue binary not found at $YUE_BIN${NC}"
    echo "Please build the project first:"
    echo "  make debug"
    echo "Or set YUE_BIN environment variable"
    exit 1
fi

# Track overall results
TOTAL_SUITES=0
PASSED_SUITES=0
FAILED_SUITES=0

# Function to run a test suite
run_test_suite() {
    local suite_name="$1"
    local suite_file="$2"

    TOTAL_SUITES=$((TOTAL_SUITES + 1))
    echo ""
    echo -e "${BLUE}Running: $suite_name${NC}"
    echo "======================================"

    if bash "$suite_file"; then
        echo -e "${GREEN}✓ $suite_name PASSED${NC}"
        PASSED_SUITES=$((PASSED_SUITES + 1))
        return 0
    else
        echo -e "${RED}✗ $suite_name FAILED${NC}"
        FAILED_SUITES=$((FAILED_SUITES + 1))
        return 1
    fi
}

# Run all test suites
run_test_suite "Basic Options Test" "$SCRIPT_DIR/test_basic_options.sh"
run_test_suite "Compilation Test" "$SCRIPT_DIR/test_compilation.sh"
run_test_suite "Error Handling Test" "$SCRIPT_DIR/test_error_handling.sh"
run_test_suite "Execution Test" "$SCRIPT_DIR/test_execution.sh"

# Print final summary
echo ""
echo -e "${BLUE}======================================"
echo "Final Test Suite Summary"
echo "======================================${NC}"
echo "Total test suites: $TOTAL_SUITES"
echo -e "Passed: ${GREEN}$PASSED_SUITES${NC}"
echo -e "Failed: ${RED}$FAILED_SUITES${NC}"
echo "======================================"

if [ $FAILED_SUITES -eq 0 ]; then
    echo -e "${GREEN}All test suites passed!${NC}"
    exit 0
else
    echo -e "${RED}Some test suites failed!${NC}"
    exit 1
fi
