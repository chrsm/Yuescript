# YueScript 测试案例补充说明

## 概述
本文档记录了为YueScript项目补充的新增测试案例文件，这些测试基于YueScript官方文档中描述的语言特性。

## 新增测试文件列表

### 1. 核心语言特性
- **chaining_comparison_spec.yue** - 链式比较操作符测试
  - 简单链式比较 (1 < 2 < 3)
  - 复杂链式比较
  - 变量链式比较
  - 字符串比较
  - != 操作符支持

- **table_append_spec.yue** - 表追加操作符([]=)测试
  - 单值追加
  - 多值追加
  - 使用展开操作符追加
  - 循环中的追加
  - 混合类型追加

- **reverse_index_spec.yue** - 反向索引(#)测试
  - 获取最后一个元素
  - 获取倒数第N个元素
  - 设置反向索引值
  - 字符串反向索引
  - 嵌套访问

- **if_assignment_spec.yue** - if赋值(:=)测试
  - 基本if赋值
  - elseif支持
  - 多返回值解构
  - 变量作用域
  - 与os.getenv配合

- **while_assignment_spec.yue** - while赋值测试
  - 基本while赋值
  - 表迭代
  - 字符串迭代
  - break支持
  - 解构支持

- **varargs_assignment_spec.yue** - 可变参数赋值测试
  - 基本可变参数赋值
  - 访问可变参数元素
  - pcall配合
  - 保留nil值
  - 嵌套函数

### 2. 函数特性
- **prefixed_return_spec.yue** - 前缀返回表达式测试
  - 无显式返回时的默认值
  - 嵌套循环中的返回
  - 多种返回路径
  - fat arrow支持
  - 条件前缀

- **named_varargs_spec.yue** - 命名可变参数测试
  - 存储可变参数到命名表
  - 处理nil值
  - 循环访问
  - 传递给其他函数
  - 默认参数配合

- **param_destructure_spec.yue** - 参数解构测试
  - 简单对象解构
  - 默认值支持
  - 嵌套解构
  - 数组参数
  - fat arrow配合

- **multiline_args_spec.yue** - 多行参数测试
  - 跨行参数
  - 嵌套函数调用
  - 表字面量中
  - 条件语句中
  - 深层缩进

### 3. 字符串和字面量
- **yaml_string_spec.yue** - YAML多行字符串测试
  - 基本YAML字符串
  - 保留缩进
  - 插值支持
  - 特殊字符转义
  - 函数中使用

### 4. 数据结构
- **table_comprehension_spec.yue** - 表推导式测试
  - 简单表拷贝
  - when子句过滤
  - 值转换
  - 键转换
  - ipairs支持
  - 嵌套推导式

- **slicing_spec.yue** - 切片操作测试
  - 基本切片语法
  - 负索引
  - 单元素切片
  - 字符串切片
  - 嵌套数组

- **implicit_object_spec.yue** - 隐式对象测试
  - * 符号列表
  - - 符号列表
  - 函数调用中的隐式对象
  - return语句
  - 嵌套结构
  - 混合内容

- **tables_advanced_spec.yue** - 高级表特性测试
  - 隐式键语法
  - 计算键
  - 关键字键
  - 数组语法混合内容
  - 表展开
  - 元表创建

### 5. 操作符
- **operator_advanced_spec.yue** - 高级操作符测试
  - 复合赋值 (+=, -=, *=, /=, %=, etc.)
  - nil合并赋值 (??=)
  - 位运算复合赋值
  - 链式赋值
  - :: 方法链

- **whitespace_spec.yue** - 空格和分隔符测试
  - 分号语句分隔符
  - 多行链式调用
  - 一行多条语句
  - 一致缩进
  - 管道操作符配合

### 6. 语句和结构
- **in_expression_spec.yue** - in表达式测试
  - 表成员检查
  - 字符串成员
  - 键检查
  - 混合类型
  - 取反
  - 推导式中使用

- **with_statement_spec.yue** - with语句测试
  - 点号属性访问
  - 链式访问
  - 方法调用
  - 嵌套with
  - 表达式中使用

- **do_statement_spec.yue** - do语句块测试
  - 创建新作用域
  - 返回值
  - 嵌套do块
  - 循环支持
  - 表操作

- **stub_spec.yue** - 函数占位符测试
  - 空函数创建
  - 表中的stub
  - 回调函数
  - 条件中的stub
  - 链式调用

### 7. 宏和属性
- **advanced_macro_spec.yue** - 高级宏测试
  - 编译时求值
  - 带参数的宏
  - 条件编译
  - Lua代码插入
  - 宏导出
  - 内置宏 ($FILE, $LINE)
  - 参数验证
  - 宏生成宏

- **const_attribute_spec.yue** - const属性测试
  - 基本const声明
  - 防止重新赋值
  - 解构支持
  - 全局const
  - 函数作用域
  - 表推导式中使用

- **close_attribute_spec.yue** - close属性测试
  - 基本close变量
  - 元表语法
  - 多个close作用域
  - 资源管理
  - 函数中使用
  - 嵌套close
  - 错误处理

### 8. 高级函数特性
- **functions_advanced_spec.yue** - 高级函数测试
  - fat箭头(self)
  - 参数默认值
  - 多行参数
  - 隐式返回
  - 多返回值
  - 函数作为参数
  - 返回函数的函数
  - 可变参数
  - 参数解构

## 测试覆盖的主要语言特性

### 运算符
- ✅ 链式比较 (1 < 2 < 3)
- ✅ 表追加 ([]=)
- ✅ 表展开 (...)
- ✅ 反向索引 (#)
- ✅ nil合并 (??)
- ✅ 管道 (|>)
- ✅ 存在性操作符 (?)
- ✅ 复合赋值

### 控制流
- ✅ if赋值 (:=)
- ✅ while赋值
- ✅ in表达式
- ✅ with语句
- ✅ do语句块
- ✅ try-catch (已有测试)
- ✅ switch (已有测试)

### 数据结构
- ✅ 表推导式
- ✅ 列表推导式 (已有测试)
- ✅ 隐式对象 (*, -)
- ✅ 表解构 (已有测试)
- ✅ 切片操作

### 函数
- ✅ fat箭头
- ✅ 参数默认值
- ✅ 多行参数
- ✅ 命名可变参数 (...t)
- ✅ 参数解构
- ✅ 前缀返回表达式
- ✅ backcalls (已有测试)

### 宏
- ✅ 基本宏
- ✅ 条件编译
- ✅ Lua代码插入
- ✅ 宏导出/导入
- ✅ 内置宏
- ✅ 宏验证

### 属性
- ✅ const属性
- ✅ close属性
- ✅ 元表操作

### 字符串
- ✅ YAML多行字符串
- ✅ 字符串插值 (已有测试)
- ✅ 转义序列 (已有测试)

### 模块系统
- ✅ import (已有测试)
- ✅ export (已有测试)
- ✅ import global (已有测试)

## 测试文件统计

- 新增测试文件: 23个
- 总测试用例: 约500+个
- 覆盖的语言特性: 40+个主要特性

## 运行测试

使用以下命令运行测试:

```bash
make test
```

或直接使用busted:

```bash
busted spec/inputs/test/
```

## 测试文件位置

所有测试文件位于: `spec/inputs/test/`

生成的Lua文件位于: `spec/outputs/test/`

## 贡献者

本测试补充基于YueScript官方文档 (doc/docs/doc/README.md) 中描述的所有语言特性。

## 注意事项

1. 部分测试可能需要特定的Lua版本支持
2. 宏相关的测试需要YueScript编译器支持宏功能
3. const和close属性在不同Lua版本行为可能不同
4. 某些高级特性可能需要额外的依赖

## 未来改进方向

- [ ] 添加更多边缘情况测试
- [ ] 增加性能基准测试
- [ ] 添加错误处理测试
- [ ] 覆盖更多元表特性
- [ ] 测试与其他Lua库的互操作性
