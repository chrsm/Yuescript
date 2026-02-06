#!/bin/bash
# Main test runner for YueScript CLI
# Runs all CLI test suites

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
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

# Track test case statistics
TOTAL_TESTS=0
TOTAL_PASSED=0
TOTAL_FAILED=0

# Array to store suite results
declare -a SUITE_NAMES
declare -a SUITE_PASSED
declare -a SUITE_FAILED
declare -a SUITE_STATUS

# Function to run a test suite
run_test_suite() {
    local suite_name="$1"
    local suite_file="$2"

    TOTAL_SUITES=$((TOTAL_SUITES + 1))
    echo ""
    echo -e "${BLUE}Running: $suite_name${NC}"
    echo "======================================"

    # Run the test suite and capture output
    local output
    output=$(bash "$suite_file" 2>&1)
    local exit_code=$?

    # Echo the output
    echo "$output"

    # Parse test statistics from output using awk
    # Look for lines like "Total tests: 7", "Passed: 7", "Failed: 0"
    # Remove ANSI color codes before parsing
    local clean_output=$(echo "$output" | sed 's/\x1b\[[0-9;]*m//g')
    local suite_total=$(echo "$clean_output" | grep -E "Total tests:" | tail -1 | awk '{print $NF}')
    local suite_passed=$(echo "$clean_output" | grep -E "Passed:" | tail -1 | awk '{print $NF}')
    local suite_failed=$(echo "$clean_output" | grep -E "Failed:" | tail -1 | awk '{print $NF}')

    # Default to 0 if not found
    suite_total=${suite_total:-0}
    suite_passed=${suite_passed:-0}
    suite_failed=${suite_failed:-0}

    # Validate that they are numbers
    [[ ! "$suite_total" =~ ^[0-9]+$ ]] && suite_total=0
    [[ ! "$suite_passed" =~ ^[0-9]+$ ]] && suite_passed=0
    [[ ! "$suite_failed" =~ ^[0-9]+$ ]] && suite_failed=0

    # Store results
    SUITE_NAMES+=("$suite_name")
    SUITE_PASSED+=($suite_passed)
    SUITE_FAILED+=($suite_failed)

    # Update totals
    TOTAL_TESTS=$((TOTAL_TESTS + suite_total))
    TOTAL_PASSED=$((TOTAL_PASSED + suite_passed))
    TOTAL_FAILED=$((TOTAL_FAILED + suite_failed))

    if [ $exit_code -eq 0 ]; then
        echo -e "${GREEN}✓ $suite_name PASSED${NC}"
        PASSED_SUITES=$((PASSED_SUITES + 1))
        SUITE_STATUS+=("PASS")
        return 0
    else
        echo -e "${RED}✗ $suite_name FAILED${NC}"
        FAILED_SUITES=$((FAILED_SUITES + 1))
        SUITE_STATUS+=("FAIL")
        return 1
    fi
}

# Run all test suites
run_test_suite "Basic Options Test" "$SCRIPT_DIR/test_basic_options.sh"
run_test_suite "Compilation Test" "$SCRIPT_DIR/test_compilation.sh"
run_test_suite "Error Handling Test" "$SCRIPT_DIR/test_error_handling.sh"
run_test_suite "Execution Test" "$SCRIPT_DIR/test_execution.sh"

# Print detailed summary
echo ""
echo -e "${CYAN}╔════════════════════════════════════════════════════════╗"
echo "║           YueScript CLI Test Results Summary            ║"
echo "╚════════════════════════════════════════════════════════╝${NC}"
echo ""

# Print per-suite statistics
echo -e "${CYAN}Test Suite Details:${NC}"
echo "┌────────────────────────────────┬────────┬────────┬────────┬──────────┐"
echo "│ Test Suite                      │ Total  │ Passed │ Failed │ Status   │"
echo "├────────────────────────────────┼────────┼────────┼────────┼──────────┤"

for ((i=0; i<TOTAL_SUITES; i++)); do
    name="${SUITE_NAMES[$i]}"
    passed="${SUITE_PASSED[$i]}"
    failed="${SUITE_FAILED[$i]}"
    total=$((passed + failed))
    status="${SUITE_STATUS[$i]}"

    # Format suite name (truncate if too long)
    name_display=$(printf "%.30s" "$name")
    printf "│ %-30s │ %6d │ %6d │ %6d │ " "$name_display" $total $passed $failed

    if [ "$status" = "PASS" ]; then
        echo -e "${GREEN}✓ PASS   ${NC}│"
    else
        echo -e "${RED}✗ FAIL   ${NC}│"
    fi
done

echo "└────────────────────────────────┴────────┴────────┴────────┴──────────┘"
echo ""

# Print overall statistics
echo -e "${CYAN}Overall Statistics:${NC}"
echo "┌─────────────────────────────────────────────────────────────────┐"
printf "│ Total Test Suites:   %3d                                          │\n" $TOTAL_SUITES
printf "│ Passed Test Suites:  %3d                                          │\n" $PASSED_SUITES
printf "│ Failed Test Suites:  %3d                                          │\n" $FAILED_SUITES
echo "├─────────────────────────────────────────────────────────────────┤"
printf "│ Total Test Cases:   %3d                                          │\n" $TOTAL_TESTS
printf "│ Passed Test Cases:  %3d                                          │\n" $TOTAL_PASSED
printf "│ Failed Test Cases:  %3d                                          │\n" $TOTAL_FAILED
echo "└─────────────────────────────────────────────────────────────────┘"
echo ""

# Calculate pass rate
if [ $TOTAL_TESTS -gt 0 ]; then
    pass_rate=$((TOTAL_PASSED * 100 / TOTAL_TESTS))
    echo -e "Overall Pass Rate: ${CYAN}$pass_rate%%${NC}"
    echo ""
fi

# Final verdict
echo -e "${BLUE}======================================"
echo "Final Verdict"
echo "======================================${NC}"

if [ $FAILED_SUITES -eq 0 ]; then
    echo -e "${GREEN}✓ All test suites passed!${NC}"
    echo -e "${GREEN}✓ All $TOTAL_TESTS test cases passed!${NC}"
    exit 0
else
    echo -e "${RED}✗ $FAILED_SUITES test suite(s) failed${NC}"
    echo -e "${RED}✗ $TOTAL_FAILED test case(s) failed${NC}"
    exit 1
fi
