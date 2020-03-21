# 1. 条件
### （1）结构
1. 单分支if语句
```
if  condition
then
    statement
fi
```
```
if  condition;  then
    statement
fi
```
2. 双分支if语句
```
if  condition
then
   statement1
else
   statement2
fi
```
3. 多分支if语句
```
if  condition1
then
   statement1
elif condition2
then
    statement2
……
else
   statementn
fi
```
- 注意，if 和 elif 后边都得跟着 then

### （2）语法说明
2. 在shell中，then和fi是分开的语句。如果要在同一行里面输入，则需要用分号将他们隔开

### （2）条件
1. [ ]表示条件测试。这里的空格很重要。要注意在'['后面和']'前面都必须要有空格
2. 








### 循环

# 2. 逻辑
### 字符串比较
1. ==：等于
2. !=：不等
3. > ：大于
4. < ：小于

### 整数比较
1. -eq：测试两个整数是否相等
2. -ne：测试两个整数是否不等
3. -gt：测试一个数是否大于另一个数
4. -lt：测试一个数是否小于另一个数
5. -ge：大于或等于
6. -le：小于或等于

### 文件测试
1.