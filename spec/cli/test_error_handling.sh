#!/bin/bash
# Test Error Handling for YueScript CLI
# Tests: Syntax errors, file not found, invalid options

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/cli_test_helper.sh"

# Check binary
check_yue_binary

# Setup test environment
setup_test_env
TMP_DIR=$(get_test_tmp_dir)

echo "========================================"
echo "Testing Error Handling"
echo "========================================"
echo ""

# Test 1: Non-existent file
echo "Testing non-existent file..."
assert_failure "Compiling non-existent file should fail" $YUE_BIN "$TMP_DIR/nonexistent.yue"

# Test 2: Syntax error in YueScript code
echo ""
echo "Testing syntax error..."
cat > "$TMP_DIR/syntax_error.yue" << 'EOF'
print "unclosed string
EOF

assert_failure "Compiling file with syntax error should fail" $YUE_BIN "$TMP_DIR/syntax_error.yue"

# Test 3: Invalid option combination
echo ""
echo "Testing invalid option combinations..."
cat > "$TMP_DIR/test1.yue" << 'EOF'
print "test"
EOF

cat > "$TMP_DIR/test2.yue" << 'EOF'
print "test2"
EOF

# -o with multiple files should fail
assert_failure "-o with multiple input files should fail" $YUE_BIN -o output.lua "$TMP_DIR/test1.yue" "$TMP_DIR/test2.yue" 2>&1 || true

# Test 4: Empty file
echo ""
echo "Testing empty file..."
touch "$TMP_DIR/empty.yue"
assert_success "Compiling empty file should succeed" $YUE_BIN "$TMP_DIR/empty.yue"

# Test 5: File with only comments
echo ""
echo "Testing file with only comments..."
cat > "$TMP_DIR/only_comments.yue" << 'EOF'
-- This is a comment
-- Another comment
EOF

assert_success "Compiling file with only comments should succeed" $YUE_BIN "$TMP_DIR/only_comments.yue"

# Test 6: Invalid Lua target version
echo ""
echo "Testing invalid target version..."
cat > "$TMP_DIR/test_target.yue" << 'EOF'
print "test"
EOF

# Note: Invalid target versions may be silently accepted or ignored
assert_success "Invalid target version is accepted (may be ignored)" $YUE_BIN "$TMP_DIR/test_target.yue" --target 9.9

# Test 7: Complex YueScript with various features
echo ""
echo "Testing complex valid YueScript..."
cat > "$TMP_DIR/complex.yue" << 'EOF'
-- Class definition
class MyClass
    new: (@value) =>

    get_value: =>
        @value

    set_value: (@value) =>

-- Table comprehension
numbers = [1, 2, 3, 4, 5]
squared = [x * x for x in numbers]

-- String interpolation
name = "YueScript"
message = "Hello, #{name}!"

-- Export statement
export MyClass, squared, message
EOF

assert_success "Compiling complex YueScript should succeed" $YUE_BIN "$TMP_DIR/complex.yue"

# Test 8: Watch mode with file (should fail)
echo ""
echo "Testing watch mode restrictions..."
assert_failure "Watch mode with file input should fail" $YUE_BIN -w "$TMP_DIR/test1.yue" 2>&1 || true

# Test 9: Invalid use of stdin/stdout
echo ""
echo "Testing invalid stdin usage..."
assert_failure "Stdin with additional arguments should fail" $YUE_BIN - "$TMP_DIR/test1.yue" 2>&1 || true

# Test 10: Check for proper error messages
echo ""
echo "Testing error message quality..."
cat > "$TMP_DIR/error_msg.yue" << 'EOF'
undef_var = undefined_value
EOF

assert_output_contains "Error message should contain file name" "error_msg.yue" $YUE_BIN "$TMP_DIR/error_msg.yue" || true

# Test 11: Unicode handling
echo ""
echo "Testing Unicode in source files..."
cat > "$TMP_DIR/unicode.yue" << 'EOF'
-- Unicode characters
message = "你好世界 🌍"
print message
EOF

assert_success "Compiling file with Unicode should succeed" $YUE_BIN "$TMP_DIR/unicode.yue"

# Test 12: Very long line
echo ""
echo "Testing very long line..."
# Generate a long line using printf instead of python
LONG_LINE="x = "
for i in $(seq 1 100); do
    LONG_LINE="${LONG_LINE}1 + "
done
LONG_LINE="${LONG_LINE}1"
echo "$LONG_LINE" > "$TMP_DIR/long_line.yue"
assert_success "Compiling file with very long line should succeed" $YUE_BIN "$TMP_DIR/long_line.yue"

# Test 13: Deep nesting
echo ""
echo "Testing deeply nested code..."
cat > "$TMP_DIR/deep_nested.yue" << 'EOF'
if true
    if true
        if true
            if true
                if true
                    print "deep"
EOF

assert_success "Compiling deeply nested code should succeed" $YUE_BIN "$TMP_DIR/deep_nested.yue"

# Test 14: Invalid syntax in macro
echo ""
echo "Testing macro error handling..."
cat > "$TMP_DIR/macro_error.yue" << 'EOF'
macro bad_macro
    error: invalid syntax here

print "test"
EOF

assert_failure "Compiling file with invalid macro should fail" $YUE_BIN "$TMP_DIR/macro_error.yue"

echo ""
print_summary
