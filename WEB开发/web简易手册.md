# Web 开发学习手册（HTML / CSS 选择器 / JavaScript 入门）

> 依据 HTML\test01~08、CSS\test01~06、JS\test01~06 练习内容整理，适合快速回顾。

---

## 一、HTML 部分

### 1. 文档结构

| 标签 | 作用 | 要点 |
|------|------|------|
| `<!DOCTYPE html>` | 文件类型声明 | 必须大写、必须在文件最前面（前面不能有任何文字和注释） |
| `<html>` | 根标签（双标签） | 包裹整个页面 |
| `<head>` | 头部 | 放 title、meta、link、style、script |
| `<title>` | 文档标题 | 显示在浏览器标签页 |
| `<meta charset="UTF-8">` | 字符编码 | 防止中文乱码 |
| `<link>` | 链接外部文件 | `rel="stylesheet"` 引 CSS；`rel="icon"` 引图标 |
| `<style>` | 内部样式表 | 写在 head 中 |
| `<script>` | 脚本 | 内嵌 JS 代码，或 `src` 引外部 js 文件 |

| `<body>` | 主体 | 页面可见内容 |
| `<form>` | 表单标签 | 包裹表单控件，实现信息提交（**重点**，详见下方） |

> **`<form>` 标签（重要）**：只有包裹在 `<form>` 内的控件才能实现表单信息提交。
> ```html
> <form method="get" action="URL" name="表单名"> ...控件... </form>
> ```
> - `action`：表单数据提交到的目标 URL
> - `name`：表单名称，供 JavaScript 调用（如 `document.f1.submit()`）
> - `method`：提交方式，取值为 `get` 或 `post`，二者区别见下表
>
> **get 与 post 提交方式对比：**
>
> | 对比项 | get（默认） | post |
> |--------|-------------|------|
> | 数据位置 | 拼接在 URL 后（`?a=1&b=2`），**显示在地址栏** | 放在请求体中，**不显示在地址栏** |
> | 可见性/安全 | 数据可见，不适合密码等敏感信息 | 数据隐蔽，相对安全 |
> | 数据长度 | 受 URL 长度限制（约 1024~2048 字符） | 理论上无限制，适合大数据/文件上传 |
> | 缓存/收藏 | 可被缓存、可收藏为书签 | 不会被缓存、不可收藏 |
> | 典型场景 | 搜索、查询等只读操作 | 登录、注册、提交、上传等写操作 |

### 2. 常用内容标签

| 标签 | 作用 | 常用属性 |
|------|------|---------|
| `<h1>`~`<h6>` | 标题，从大到小 | — |
| `<hr>` | 水平分割线 | width、align、color |
| `<p>` | 段落 | — |
| `<div>` | 块级区域，占满父元素宽度 | align（已废弃，建议用 CSS） |
| `<b>/<i>/<u>/<s>` | 加粗/斜体/下划线/删除线 | — |
| `<font>` | 字体（旧标签） | color、size、face |
| `<br>` | 换行 | — |
| `&nbsp;` | 空格实体 | 用于对齐冒号等场景 |

**列表：**
- `<ol>` + `<li>`：有序列表
- `<ul type="square">` + `<li>`：无序列表
- `<dl>` + `<dt>` + `<dd>`：定义列表（dt 必须在 dd 之前）

**表格：**
```html
<table border="1">
    <tr height="50"> <th>表头</th> </tr>
    <tr> <td>单元格</td> </tr>
</table>
```
- 结构：table > tr > td（th 为表头）
- `border` 设置边框宽度（像素）；行高列宽多用 CSS 控制

**超链接与图片：**
```html
<a href="URL" target="_blank">文字</a>   <!-- _blank 新窗口打开 -->
<img src="路径" alt="替代文本" width height>  <!-- 只写宽或高会等比缩放 -->
<a href="..."><img src="..."></a>        <!-- 图片包链接：点击图片跳转 -->
```

### 3. 表单（重点）

```html
<form method="get" action="URL" name="表单名">
    ...控件...
</form>
```
- `method`：get（数据显示在 URL 中）/ post（不显示）
- `action`：提交到的 URL
- 控件必须有 `name` 和 `value`，否则提交空值

**input 类型清单：**

| type | 说明 | 关键属性 |
|------|------|---------|
| text | 文本框 | value、readonly、placeholder |
| password | 密码框（掩码） | 同上 |
| radio | 单选框 | **同 name 互斥**；需 value；checked 默认选中 |
| checkbox | 复选框 | 不选 value=OFF，选 value=ON；checked |
| submit | 提交按钮 | 提交并跳转 action |
| reset | 重置按钮 | 清空输入、取消选中 |
| button | 普通按钮 | 无默认功能，靠 onclick 等事件 |
| range / date / time / datetime-local / color | 滑动条/日期/时间/日期时间/颜色 | min、max |

**其他表单标签：**
```html
<select name="brand">
    <option selected="selected">请选择</option>
    <option value="huawei">华为</option>
</select>
```
- option 不写 value 时，用显示文字作为 value

**通用属性：** id（唯一）、name（可重复）、class（可多个，空格分隔）、style、tabindex（焦点顺序）、disabled（禁用按钮）

**事件属性（onXXX）：** onclick、ondblclick、onmouseover、onmouseout、onmousedown、onmouseup、onload（body）。值必须是 JS 代码。

### 4. 特殊字符实体

`&nbsp;` 空格、`&lt;` <、`&gt;` >、`&amp;` &、`&copy;` ©、`&reg;` ®、`&yen;` ¥

### 5. 注释

`<!-- 注释，可多行不可嵌套 -->`

---

## 二、CSS 选择器部分

### 1. 三种样式位置

| 类型 | 位置 | 是否需要选择器 |
|------|------|--------------|
| 内联 | 标签 style 属性 | 不需要 |
| 内部 | head 的 `<style>` 标签 | 需要 |
| 外部 | .css 文件 + `<link>` 引入 | 需要 |

语法：`选择器 { 属性: 值; }`，注释用 `/* */`

**属性值格式：** 单个 `color:red;` / 简写(结构体) `border:1px solid red;` / 范围 `margin:10px 20px;`

### 2. 一般选择器（4 种）

| 选择器 | 格式 | 说明 |
|--------|------|------|
| id 选择器 | `#id值` | 唯一，定位快，优先级最高 |
| 属性选择器 | `[name]`、`[name="a2"]`、`[name*="CCB"]`(包含)、`[name^="U"]`(开头)、`[name$="123"]`(结尾) | 按属性定位 |
| 类选择器 | `.类名`、`.a3.a1`(同时含两类) | 可重复，优先级低；后写覆盖先写 |
| 标签选择器 | `标签名` | 定位所有该标签 |

**优先级：** `#id` > `.class` > `[属性]` > `标签名`

### 3. 派生选择器（3 种）

| 类型 | 格式 | 含义 |
|------|------|------|
| 子选择器 | `父 > 子` | 直接子元素 |
| 后代选择器 | `父 后代`（空格） | 所有层级后代 |
| 相邻兄弟 | `兄 + 弟` | 紧跟的下一个兄弟 |

组合示例：`#div4 [name="a2"] + br + input { ... }`

### 4. 伪类选择器

**超链接四态（必须按顺序定义，不可跳过）：**
`a:link`(未访问) → `a:visited`(已访问) → `a:hover`(悬停) → `a:active`(点击)

**子元素位置伪类：**

| 伪类 | 含义 |
|------|------|
| `:first-child` / `:last-child` | 父下第1个/最后1个子元素 |
| `:nth-child(n)` / `:nth-last-child(n)` | 正数/倒数第 n 个子元素 |
| `:first-of-type` / `:last-of-type` | 该类型中第1个/最后1个 |
| `:nth-of-type(n)` / `:nth-last-of-type(n)` | 该类型中正数/倒数第 n 个 |

**易错点：** `-child` 先数位置再判类型；`-of-type` 先筛类型再数位置。
例：`#a1 > input:last-child` 选不中，因为最后一个子元素是 `<br>`；应使用 `input:last-of-type`。

---

## 三、JavaScript 入门部分

### 1. 基本规则
- 严格区分大小写；必须 UTF-8 编码；代码写在 `<script>` 中
- 三种嵌入方式：内嵌 `<script>`、外部 `<script src="xx.js">`、内联事件属性 `onclick="fn()"`
- 注释：`//` 单行、`/* */` 多行

### 2. 变量与命名
```javascript
var 变量名 = 值;   // 显式声明
变量名 = 值;       // 隐式声明
```
命名规则：字母/数字/下划线/美元符；不能数字开头；不能用保留字。
规范：驼峰 `userName`、下划线 `user_name`、匈牙利 `intAge`。

### 3. 数据类型

| 类型 | 说明 |
|------|------|
| number | 不区分整数浮点 |
| string | 单引号/双引号/反引号 |
| boolean | true / false |
| array | `Arr=[1,1.1,"hi",true,null]`；索引从 0 开始；`Arr.length` 为个数 |
| object | `对象.属性`、`对象.方法()` |
| function | 自定义操作 |
| null | 空值 |

### 4. 常用内置函数

| 函数 | 作用 | 返回值 |
|------|------|--------|
| `alert(x)` | 弹出提示框 | 无 |
| `confirm("...")` | 确认框（确定/取消） | true / false |
| `prompt("...")` | 输入对话框 | 用户输入的字符串 |
| `Number(x)` | 字符串转数字 | 数字 |
| `console.log(x)` | 控制台输出 | — |

### 5. document 对象（操作页面）

| 方法/用法 | 作用 |
|-----------|------|
| `document.write("html代码")` | 向页面写入内容（会改写文档） |
| `document.getElementById("id")` | 按 id 获取元素对象 |
| `document.getElementsByName("n")[i]` | 按 name 获取**数组**，需索引 |
| `document.getElementsByClassName("c")[i]` | 按 class 获取数组 |
| `document.querySelector(选择器)` | 按 CSS 选择器获取单个 |
| `document.querySelectorAll(选择器)` | 按 CSS 选择器获取集合 |

**元素常用属性读写：** `.value`（输入框值）、`.name`、`.className`、`.src`（图片路径，可写实现换图）

**表单操作：**
```javascript
document.f1.submit();   // 按表单 name 提交
document.f1.reset();    // 重置表单
document.f1.T1.value.length;  // 表单内控件的值长度
```

### 6. 自定义函数

```javascript
function 函数名(形参1, 形参2){
    // 函数体
    return 结果;   // 无 return 则返回 undefined
}
函数名(实参1, 实参2);   // 调用
```

### 7. 典型代码模式

**图片切换（flag 变量）：**
```javascript
x = 1;
function switchImg(){
    if(x == 1){
        x = 0;
        document.getElementById("i1").src = "../Asset/Laoda_zhouji.webp";
    }else{
        x = 1;
        document.getElementById("i1").src = "../Asset/Laoda.webp";
    }
}
```
注意：切换逻辑必须写在函数**内部**，否则只在页面加载时执行一次。

**表单验证：**
```javascript
function submit_form(){
    len = document.getElementById("a1").value.length;
    if(len >= 10 && len <= 20){
        document.f1.submit();
    }else{
        alert("长度必须在10到20个字符之间");
        if(confirm("是否强制提交？")){ document.f1.submit(); }
    }
}
```

**文本双倍：**
```javascript
function double_text(){
    Txt = document.getElementById("a1").value;
    document.getElementById("a1").value = Txt + Txt;  // 字符串拼接
}
```
注意：`+` 对字符串是拼接（"1"+"1"="11"）；要数学相加需 `Number()` 或 `parseInt()` 转换。

---

## 四、易错点速查

1. `<!DOCTYPE>` 前不能有任何内容（含注释）
2. radio 同 name 才互斥；checkbox 一般不同 name
3. CSS 优先级：#id > .class > [属性] > 标签
4. a 的四个伪类必须按 link→visited→hover→active 顺序写
5. `-child` 与 `-of-type` 计数逻辑不同（先位置 vs 先类型）
6. JS 的 if/else 要放进函数里才能被事件反复触发
7. `getElementsByName/ClassName` 返回数组，必须加 `[索引]`
8. `<img>` 等标签别漏写结尾 `>`