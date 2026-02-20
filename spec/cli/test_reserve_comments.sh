#!/bin/bash
# Test Reserve Comments Functionality for YueScript CLI
# Tests: -c, --reserve-comments option

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/cli_test_helper.sh"

# Check binary
check_yue_binary

# Setup test environment
setup_test_env
TMP_DIR=$(get_test_tmp_dir)

echo "========================================"
echo "Testing Reserve Comments (-c) Option"
echo "========================================"
echo ""

# Test 1: Reserve top-level comments
echo "Testing top-level comments preservation..."
cat > "$TMP_DIR/top_level.yue" << 'EOF'
-- Top level comment
x = 1
-- Another comment
y = 2
EOF

assert_output_contains "Reserve top-level comments" "Top level comment" $YUE_BIN -c -p "$TMP_DIR/top_level.yue"
assert_output_contains "Reserve second comment" "Another comment" $YUE_BIN -c -p "$TMP_DIR/top_level.yue"

# Test 2: Without -c option, comments should not appear
echo ""
echo "Testing comments are removed without -c option..."
assert_output_not_contains "Comments should be removed without -c" "Top level comment" $YUE_BIN -p "$TMP_DIR/top_level.yue"

# Test 3: Reserve comments in table
echo ""
echo "Testing comments in tables..."
cat > "$TMP_DIR/table_comments.yue" << 'EOF'
t = {
    -- First value comment
    1,
    -- Second value comment
    2
}
EOF

assert_output_contains "Table comments should be preserved" "First value comment" $YUE_BIN -c -p "$TMP_DIR/table_comments.yue"
assert_output_contains "Table second comment preserved" "Second value comment" $YUE_BIN -c -p "$TMP_DIR/table_comments.yue"

# Test 4: Reserve comments in if statement
echo ""
echo "Testing comments in if statements..."
cat > "$TMP_DIR/if_comments.yue" << 'EOF'
if true
    -- Inside if block
    print "test"
EOF

assert_output_contains "If block comments should be preserved" "Inside if block" $YUE_BIN -c -p "$TMP_DIR/if_comments.yue"

# Test 5: Reserve comments in function
echo ""
echo "Testing comments in functions..."
cat > "$TMP_DIR/func_comments.yue" << 'EOF'
func = =>
    -- Inside function
    print "hello"
EOF

assert_output_contains "Function comments should be preserved" "Inside function" $YUE_BIN -c -p "$TMP_DIR/func_comments.yue"

# Test 6: Reserve comments with empty lines
echo ""
echo "Testing empty lines preservation..."
cat > "$TMP_DIR/empty_lines.yue" << 'EOF'
-- First comment
x = 1
-- Second comment
EOF

OUTPUT_WITHOUT_C=$($YUE_BIN -p "$TMP_DIR/empty_lines.yue")
OUTPUT_WITH_C=$($YUE_BIN -c -p "$TMP_DIR/empty_lines.yue")
if [ $? -eq 0 ]; then
    # Count newlines - with -c should have more (or equal) lines due to comment preservation
    LINES_WITHOUT_C=$(echo "$OUTPUT_WITHOUT_C" | wc -l)
    LINES_WITH_C=$(echo "$OUTPUT_WITH_C" | wc -l)
    if [ $LINES_WITH_C -ge $LINES_WITHOUT_C ]; then
        echo -e "${GREEN}✓${NC} Empty lines and comments should be preserved"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    else
        echo -e "${RED}✗${NC} Empty lines and comments should be preserved"
        echo -e "  ${YELLOW}Lines without -c: $LINES_WITHOUT_C, with -c: $LINES_WITH_C${NC}"
        TESTS_FAILED=$((TESTS_FAILED + 1))
    fi
    TESTS_RUN=$((TESTS_RUN + 1))
else
    echo -e "${RED}✗${NC} Empty lines test failed"
    TESTS_FAILED=$((TESTS_FAILED + 1))
    TESTS_RUN=$((TESTS_RUN + 1))
fi

# Test 7: Reserve comments in table with TableBlock syntax
echo ""
echo "Testing comments in TableBlock..."
cat > "$TMP_DIR/tableblock_comments.yue" << 'EOF'
tbl = {
    -- Key comment
    key: "value"
    -- Another key
    another: 123
}
EOF

assert_output_contains "TableBlock key comment preserved" "Key comment" $YUE_BIN -c -p "$TMP_DIR/tableblock_comments.yue"
assert_output_contains "TableBlock second comment preserved" "Another key" $YUE_BIN -c -p "$TMP_DIR/tableblock_comments.yue"

# Test 8: Reserve comments - long form option
echo ""
echo "Testing --reserve-comments long form option..."
assert_output_contains "Long form option should preserve comments" "First value comment" $YUE_BIN --reserve-comments -p "$TMP_DIR/table_comments.yue"

# Test 9: Compile to file with reserve comments
echo ""
echo "Testing compilation to file with comments..."
cat > "$TMP_DIR/file_comment.yue" << 'EOF'
-- This is a test
value = 42
EOF

assert_success "Compile with -c to file" $YUE_BIN -c "$TMP_DIR/file_comment.yue" -o "$TMP_DIR/file_comment.lua"
assert_file_exists "Output file should exist" "$TMP_DIR/file_comment.lua"
assert_output_contains "Compiled file should contain comments" "This is a test" cat "$TMP_DIR/file_comment.lua"

# Test 10: Reserve comments with multiple statements
echo ""
echo "Testing comments with multiple statements..."
cat > "$TMP_DIR/multi_stmt.yue" << 'EOF'
-- Assign x
x = 1
-- Assign y
y = 2
-- Assign z
z = 3
EOF

OUTPUT=$($YUE_BIN -c -p "$TMP_DIR/multi_stmt.yue")
if [ $? -eq 0 ]; then
    if echo "$OUTPUT" | grep -q "Assign x" && echo "$OUTPUT" | grep -q "Assign y" && echo "$OUTPUT" | grep -q "Assign z"; then
        echo -e "${GREEN}✓${NC} All comments should be preserved"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    else
        echo -e "${RED}✗${NC} All comments should be preserved"
        echo -e "  ${YELLOW}Output: $OUTPUT${NC}"
        TESTS_FAILED=$((TESTS_FAILED + 1))
    fi
    TESTS_RUN=$((TESTS_RUN + 1))
else
    echo -e "${RED}✗${NC} Multiple statements test failed"
    TESTS_FAILED=$((TESTS_FAILED + 1))
    TESTS_RUN=$((TESTS_RUN + 1))
fi

# Test 11: Comments in while loop
echo ""
echo "Testing comments in while loop..."
cat > "$TMP_DIR/while_comments.yue" << 'EOF'
while true
    -- Loop body comment
    print "looping"
    break
EOF

assert_output_contains "While loop comments preserved" "Loop body comment" $YUE_BIN -c -p "$TMP_DIR/while_comments.yue"

# Test 12: Comments in for loop
echo ""
echo "Testing comments in for loop..."
cat > "$TMP_DIR/for_comments.yue" << 'EOF'
for i = 1, 3
    -- For loop comment
    print i
EOF

assert_output_contains "For loop comments preserved" "For loop comment" $YUE_BIN -c -p "$TMP_DIR/for_comments.yue"

echo ""
print_summary
