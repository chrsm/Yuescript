# YueScript CLI Tests

测试 YueScript 命令行工具的功能。

## 测试结构

```
spec/cli/
├── cli_test_helper.sh      # 测试辅助函数库
├── test_basic_options.sh   # 基本选项测试
├── test_compilation.sh     # 编译功能测试
├── test_error_handling.sh  # 错误处理测试
├── test_execution.sh       # 代码执行测试
├── run_all_tests.sh        # 运行所有测试
└── README.md              # 本文件
```

## 运行测试

### 前置要求

确保已编译 yue 二进制文件：

```bash
make debug
```

### 运行所有测试

```bash
cd spec/cli
bash run_all_tests.sh
```

### 运行单个测试套件

```bash
# 测试基本选项
bash test_basic_options.sh

# 测试编译功能
bash test_compilation.sh

# 测试错误处理
bash test_error_handling.sh

# 测试代码执行
bash test_execution.sh
```

### 指定 yue 二进制文件路径

如果二进制文件不在默认位置 (`./bin/debug/yue`)，可以设置环境变量：

```bash
YUE_BIN=/path/to/yue bash run_all_tests.sh
```

## 测试覆盖范围

### 1. 基本选项测试 (test_basic_options.sh)

- `-h, --help`: 帮助信息
- `-v, --version`: 版本信息
- 无效选项的错误处理

### 2. 编译功能测试 (test_compilation.sh)

- 单文件编译到标准输出 (`-p`)
- 单文件编译到磁盘
- 自定义输出文件 (`-o`)
- 目标目录编译 (`-t`)
- 目录递归编译
- 保留行号 (`-l`)
- 使用空格代替制表符 (`-s`)
- 代码压缩 (`-m`)
- 标准输入/输出编译
- 全局变量转储 (`-g`)
- 编译性能测试 (`-b`)
- 目标 Lua 版本 (`--target`)

### 3. 错误处理测试 (test_error_handling.sh)

- 文件不存在错误
- 语法错误
- 无效选项组合
- 空文件处理
- 仅注释文件
- 无效的目标版本
- 复杂的合法代码
- Unicode 处理
- 超长行处理
- 深层嵌套代码
- 宏错误处理

### 4. 代码执行测试 (test_execution.sh)

- 内联代码执行 (`-e`)
- 计算表达式
- 字符串插值
- YueScript 文件执行
- Lua 文件执行
- 脚本参数传递
- 编译器选项传递
- 表操作
- 函数定义与调用
- 类与对象
- 导入语句
- 错误处理
- 导出语句
- 宏展开

## 测试辅助函数

`cli_test_helper.sh` 提供以下函数：

- `check_yue_binary`: 检查 yue 二进制文件是否存在
- `assert_success`: 断言命令成功
- `assert_failure`: 断言命令失败
- `assert_output_contains`: 断言输出包含指定字符串
- `assert_output_equals`: 断言输出等于指定字符串
- `assert_file_exists`: 断言文件存在
- `print_summary`: 打印测试摘要
- `setup_test_env`: 设置测试环境
- `create_test_file`: 创建测试文件

## 添加新测试

1. 在对应的测试文件中添加新的测试用例
2. 使用提供的辅助函数来断言结果
3. 确保测试描述清晰明了
4. 运行测试验证功能

示例：

```bash
echo "Testing new feature..."
cat > "$TMP_DIR/new_test.yue" << 'EOF'
-- test code here
EOF

assert_output_contains "New feature should work" "expected output" $YUE_BIN "$TMP_DIR/new_test.yue"
```

## 持续集成

这些测试可以集成到 CI/CD 流程中，确保每次代码变更都不会破坏命令行工具的功能。
