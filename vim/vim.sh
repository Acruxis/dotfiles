=====================================================
|||||||||| Vim 高效编辑的 20 个肌肉记忆技巧
=====================================================
||| 文档获取地址： http://file.gxhy.cc/vim.sh
||| 文件共享地址： http://zfile.gxhy.cc/zfile/
=====================================================
1. 问题背景
Vim 是每个 Linux 运维、DBA、后端工程师绕不开的工具。哪怕你不是天天写代码，看日志、改配置、写脚本、排错，几乎都要碰 Vim。
但大多数人对 Vim 的印象停留在 “按 i 进入编辑、ESC 退出、保存退出 :wq” 这一层，剩下的全靠 ↑↓←→ 和方向键慢慢摸。

熟练 Vim 的好处是肉眼可见的：

编辑速度从分钟级压到秒级

远程服务器上没法装 IDE，唯一能用的就是 Vim

大文件编辑效率吊打 nano、sed

配置文件改错可以一键 undo

肌肉记忆不是靠背，是靠练。 这 20 个技巧选的是最高频、最有杠杆效应的，每天花 10 分钟连三天就能定型。

2. 适用场景
远程服务器改配置、改脚本

看日志、过滤日志、统计日志

写 shell、Python、yaml、ini

编辑大文件（GB 级）

在容器内调试

在 CI 流水线出错时手动改代码

应急救援时没有 IDE

老旧系统只有 Vi

面试被问到 Vim

团队 vimrc 不一致时的统一配置

嵌入式设备调试

文本处理（替代 awk、sed 简单场景）

代码 review 时标注

写 Markdown、技术文档

3. 核心知识点
3.1 Vim 的四个模式
Vim 不是单一编辑器，是模式化编辑器：

模式	说明
Normal（普通模式）	默认模式，移动光标、操作文本
Insert（插入模式）	i/a/o 进入，输入字符
Visual（可视化模式）	v/V/Ctrl-v，选择文本
Command（命令模式）	: 进入，执行命令
还有 Replace（替换模式）：R 进入。

3.2 模式之间的切换
操作	效果
i	插入到光标前
a	插入到光标后
o	在下方新行插入
O	在上方新行插入
I	在行首插入
A	在行尾插入
ESC	从任意模式回 Normal
Ctrl-[	ESC 的等价快捷键
3.3 Normal 模式下的核心动作
光标移动：h/j/k/l

词移动：w/b/e

行首行尾：0/$/^

上下翻页：Ctrl-u/Ctrl-d

文件首尾：gg/G

字符查找：f/t + char（行内）

删除：d + motion

复制：y + motion

粘贴：p/P

撤销：u/Ctrl-r

3.4 数字前缀的力量
Vim 几乎所有命令都可以加数字：

5j：下移 5 行

3w：前进 3 个词

2dd：删除 2 行

4yy：复制 4 行

10G：跳到第 10 行

数字前缀是 Vim 提速的核心。

3.5 operator + motion
Vim 的核心是 operator + motion：

d：delete

y：yank（复制）

c：change（删除 + 进入插入模式）

>：缩进

<：反缩进

v：visual

motion 是动作范围：

w：词

$：到行尾

0：到行首

G：到文件尾

gg：到文件首

/pattern：到下一个匹配

?pattern：到上一个匹配

3.6 text object
iw：inner word（当前词）

aw：a word（含空格）

i"：inner " " 内容

a"：含 " " 的内容

i)：括号内

it：tag 内（HTML/XML）

3.7 寄存器与宏
默认寄存器：无名 "

命名寄存器：a-z

系统剪贴板：+（需 vim-x11 或 vim-gtk）

黑洞寄存器：_（丢弃内容）

录制宏：q + 字母开始，q 结束，@ + 字母执行。

3.8 窗口与缓冲区
:split：水平切窗

:vsplit：垂直切窗

Ctrl-w + 方向键：切换窗口

:tabnew：新建标签页

gt/gT：切换标签页

:b N：切换到第 N 个缓冲区

3.9 命令历史
q/：搜索历史

q:：命令历史

q?：搜索历史（旧语法）

4. 整体学习路径
按下面的顺序练，每个动作每天练 10 次：

周次	内容
第一周	模式切换 + 基础移动（i/a/o、ESC、hjkl、0/$、gg/G）
第二周	operator + motion（d/y/c + 各种 motion）
第三周	text object + 数字前缀
第四周	搜索替换 + 寄存器 + 宏
第五周起	配置、插件、组合技
把每天的高频操作全部走一遍，三周就能形成肌肉记忆。

5. 20 个肌肉记忆技巧（按杠杆排序）
技巧 1：模式切换用 i/a/o/O/I/A + ESC，不要用方向键
i：当前位置前

a：当前位置后

o：下方新行

O：上方新行

I：行首

A：行尾

ESC 可以按 Ctrl-[，更快。

肌肉记忆：每次想“开始打字”就 i，要“换一行继续”就 o，要“在这一行结尾加东西”就 A。

技巧 2：hjkl 移动，不要用方向键
不需要离开主键区

距离短

与其他快捷键组合方便

练法：把方向键当成“作弊器”，强迫自己用 hjkl。两天就能改掉。

肌肉记忆：移动光标 = hjkl。

技巧 3：词移动 w/b/e，比 hjkl 跨多个字符快
w：到下一个词首

b：到上一个词首

e：到当前/下一个词尾

对于长变量名、行很长，w 比 j 效率高 5-10 倍。

肌肉记忆：跨多字符 = w/b/e。

技巧 4：行内跳转 0/$/^，比 END/HOME 键快
0：行首

$：行尾

^：行首第一个非空白字符

肌肉记忆：行首 = 0，行尾 = $，第一个字符 = ^。

技巧 5：文件级跳转 gg/G
gg：到文件首

G：到文件尾

N G：到第 N 行（如 10G）

:N：同样到第 N 行

肌肉记忆：到文件头 = gg，到文件尾 = G。

技巧 6：f/F/t/T 字符跳转
f：到行内下一个 X 字符

F：到行内上一个 X 字符

t：到行内下一个 X 字符前

T：到行内上一个 X 字符后

; 重复 f，, 反向重复。

肌肉记忆：在行内找字符 = f/F/t/T。

技巧 7：删除 d + motion（dw、d$、d0、dd）
dd：删除当前行

dw：删除到下一个词首

d$：删除到行尾

d0：删除到行首

3dd：删除 3 行

dG：删除到文件尾

肌肉记忆：删除 = d + 范围。

技巧 8：复制 y + motion（yw、y$、yy）
yy：复制当前行

yw：复制一个词

y$：复制到行尾

yG：复制到文件尾

肌肉记忆：复制 = y + 范围。

技巧 9：粘贴 p/P
p：粘贴到光标后（行下）

P：粘贴到光标前（行上）

粘贴行为会按删除/复制的内容自动调整。

肌肉记忆：粘贴 = p。

技巧 10：撤销与重做 u/Ctrl-r
u：撤销

Ctrl-r：重做

U：撤销当前行的所有改动

肌肉记忆：u 是“后悔药”。

技巧 11：搜索 / + n/N
/pattern：向下搜

?pattern：向上搜

n：下一个匹配

N：上一个匹配

*：搜索光标下的词（向下）

#：搜索光标下的词（向上）

肌肉记忆：搜索 = / + Enter，跳转 = n。

技巧 12：替换 :s
:s/old/new：当前行第一个匹配

:s/old/new/g：当前行所有匹配

:%s/old/new/g：全文所有匹配

:%s/old/new/gc：替换并确认

:5,10s/old/new/g：替换第 5 到 10 行

肌肉记忆：替换 = :%s/old/new/g。

技巧 13：可视化选择 v/V/Ctrl-v
v：字符可视化

V：行可视化

Ctrl-v：块可视化（矩形）

选中后可以：

d：删除

y：复制

>：缩进

:：对选中区域执行命令

Ctrl-v 块选择是注释、编辑多行的利器。

肌肉记忆：v 选字符，V 选行，Ctrl-v 选块。

技巧 14：缩进 >> 和 <<
>>：缩进当前行

<<：反缩进

> motion：缩进一个范围

在 V 模式下 > 缩进选中行

肌肉记忆：缩进 = >>，反缩进 = <<。

技巧 15：插入模式下的快捷键
Ctrl-h：删除前一个字符（等同 backspace）

Ctrl-w：删除前一个词

Ctrl-u：删除到行首

Ctrl-a：插入上一个 insert 的内容

Ctrl-e：插入下一行同列内容

Ctrl-r + 寄存器：插入寄存器内容（如 Ctrl-r " 插入无名寄存器）

肌肉记忆：插入模式下的 Ctrl 键是隐藏快捷键。

技巧 16：寄存器 " + 命令
"ayy：复制当前行到寄存器 a

"ap：粘贴寄存器 a 的内容

"+yy：复制到系统剪贴板

"+p：从系统剪贴板粘贴

"_d：删除到黑洞（不污染剪贴板）

肌肉记忆：寄存器 = " + 字母。

技巧 17：宏 q + 字母 + q + @ + 字母
q + 字母（如 qa）：开始录制到寄存器 a

执行操作

q：结束录制

@a：执行宏

@@：重复执行上一个宏

数字 + @a：执行多次

例：把每一行的末尾加分号：

vim
qa
A;
<Esc>
q
:%normal @a
肌肉记忆：宏 = q + 字母 + 操作 + q + @ + 字母。

技巧 18：窗口 :split / :vsplit / Ctrl-w
:split：水平切窗

:vsplit：垂直切窗

:split 文件：水平切窗并打开文件

Ctrl-w + h/j/k/l：切换窗口

Ctrl-w + w：循环切换窗口

Ctrl-w + c：关闭当前窗口

Ctrl-w + =：等分窗口

肌肉记忆：分屏 = :vsplit，切换 = Ctrl-w。

技巧 19：常用 :! 与 :r 执行 shell
:!command：执行 shell 命令

:r !command：把命令输出读入文件

:r file：读入文件内容

例如 :!ls 执行 ls，:r !date 把当前日期插入到光标位置。

肌肉记忆：临时执行命令 = :!。

技巧 20：常用设置 :set
命令	作用
:set nu	显示行号
:set relativenumber	相对行号（移动神器）
:set hlsearch	高亮搜索
:set incsearch	增量搜索
:set ignorecase	忽略大小写
:set smartcase	智能大小写
:set tabstop=4	Tab 显示宽度
:set shiftwidth=4	缩进宽度
:set expandtab	Tab 转空格
:set autoindent	自动缩进
:set cursorline	高亮当前行
:set showmatch	显示配对括号
:set laststatus=2	总是显示状态栏
:set scrolloff=5	光标上下留 5 行
:syntax on	语法高亮
:filetype on	文件类型检测
肌肉记忆：:set 是配置神器，常用配置放在 .vimrc。

6. 常用 .vimrc 配置
6.1 基础配置
vim
" 基础设置
set nocompatible
syntax on
filetype on
filetype plugin indent on

set encoding=utf-8
set fileencoding=utf-8

set number
set relativenumber
set cursorline
set scrolloff=5

set showmatch
set showcmd

set ignorecase
set smartcase
set incsearch
set hlsearch

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set autoindent
set smartindent

set laststatus=2
set ruler

set wildmenu
set wildmode=longest:list,full

set backspace=indent,eol,start
set history=1000

set ttimeoutlen=100
set notimeout ttimeout
6.2 键位映射
vim
" 快速移动
nnoremap <C-j> 5j
nnoremap <C-k> 5k
nnoremap <C-h> 5h
nnoremap <C-l> 5l

" 快速保存
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

" 快速退出
nnoremap <C-q> :wq<CR>

" 清除搜索高亮
nnoremap <Esc><Esc> :nohlsearch<CR>

" 翻页
nnoremap <C-d> <C-d>
nnoremap <C-u> <C-u>

" 块编辑
vnoremap <C-c> "+y
vnoremap <C-x> "+x

" 自动补全
inoremap <C-n> <C-n>
inoremap <C-p> <C-p>

" 切换 buffer
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
6.3 主题与外观
vim
" 颜色
colorscheme desert
" 或
colorscheme molokai
" 或
colorscheme solarized

" 字体
set guifont=Monaco:h13
6.4 文件类型配置
vim
" Python
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType python setlocal textwidth=79

" Shell
autocmd FileType sh setlocal tabstop=2 shiftwidth=2 expandtab

" YAML
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 expandtab

" Markdown
autocmd FileType markdown setlocal textwidth=0 wrapmargin=0
6.5 自动命令
vim
" 去除 Windows 换行
autocmd BufRead * set fileformat=unix

" 退出时自动保存 session
autocmd VimLeavePre * mksession! ~/.vim/session.vim

" 进入目录自动加载 session
autocmd VimEnter * silent! source ~/.vim/session.vim
7. 常用命令速查
7.1 基础命令
vim
:e <file>          " 打开文件
:w                 " 保存
:q                 " 退出
:wq                " 保存退出
:q!                " 强制退出
:x                 " 保存退出（无改动时不改 mtime）
:e!                " 放弃改动重新加载
:r <file>          " 读入文件
:r! <cmd>          " 读入命令输出
:! <cmd>           " 执行命令
7.2 搜索命令
vim
:set hlsearch      " 启用高亮
:set nohlsearch    " 关闭高亮
:nohlsearch        " 临时关闭高亮
:grep <pattern>    " 用 grep 搜索
:cnext             " 下一个 quickfix
:cprevious         " 上一个 quickfix
7.3 替换命令
vim
:s/old/new             " 当前行第一个
:s/old/new/g           " 当前行全部
:%s/old/new/g          " 全文全部
:%s/old/new/gc         " 全部并确认
:'<,'>s/old/new/g      " 选中区域
:5,10s/old/new/g       " 5-10 行
7.4 缓冲区命令
vim
:ls                  " 列出所有 buffer
:b <N>               " 切换到第 N 个 buffer
:bd                  " 删除当前 buffer
:bn                  " 下一个 buffer
:bp                  " 上一个 buffer
:bf                  " 第一个 buffer
:bl                  " 最后一个 buffer
7.5 窗口命令
vim
:split               " 水平分屏
:vsplit              " 垂直分屏
:split <file>        " 水平分屏打开文件
:vsplit <file>       " 垂直分屏打开文件
Ctrl-w + q           " 关闭窗口
Ctrl-w + c           " 关闭窗口（同上）
Ctrl-w + s           " 水平分屏（与 split 同）
Ctrl-w + v           " 垂直分屏（与 vsplit 同）
7.6 标签页
vim
:tabnew              " 新建标签
:tabnew <file>       " 新建标签打开文件
:tabnext             " 下一个标签（gt）
:tabprevious         " 上一个标签（gT）
:tabfirst            " 第一个标签
:tablast             " 最后一个标签
:tabclose            " 关闭标签
7.7 折叠
vim
:foldenable          " 启用折叠
:foldmethod=manual   " 手动折叠
:zf                  " 创建折叠
:zo                  " 打开折叠
:zc                  " 关闭折叠
:zR                  " 打开所有折叠
:zM                  " 关闭所有折叠
7.8 标记
vim
ma                   " 设置 a 标记
'a                   " 跳到 a 标记
:marks               " 列出所有标记
:delmarks a          " 删除 a 标记
7.9 宏
vim
qa                   " 录制到寄存器 a
q                    " 停止录制
@a                   " 执行宏 a
@@                   " 重复上次宏
100@a                " 执行 100 次
7.10 diff 模式
vim
vimdiff a.txt b.txt
:diffupdate
:diffget
:diffput
:diffoff
8. 日志与指标观察方法
8.1 看编辑历史
vim
:changes             " 列出所有改动
:earlier 5m          " 回到 5 分钟前的状态
:later 5m            " 前进到 5 分钟后的状态
:undo                " 撤销
:redo                " 重做
8.2 看编辑时间
vim
:ed                  " 重新加载并显示编辑时间
8.3 看命令历史
vim
q:                   " 进入命令历史窗口
:<Up>                " 上一条命令
8.4 看搜索历史
vim
q/                   " 进入搜索历史
8.5 看寄存器内容
vim
:registers           " 列出所有寄存器
8.6 看 buffer 列表
vim
:ls                  " 列出所有 buffer
:buffers             " 同上
8.7 看 jump 列表
vim
:ju                  " 列出 jump 历史
:ju!                 " 列出 jump（含当前位置）
8.8 看 mark 列表
vim
:marks               " 列出所有 mark
8.9 看宏统计
vim
:reg a               " 看寄存器 a 的内容
8.10 编辑时间统计
vim
:set showcmd         " 显示已输入的命令
9. 常见场景快捷键组合
9.1 改一个变量名
vim
" 选中变量名（先 / 搜索）
ciw                  " 改 inner word
更系统的方法：

vim
:%s/oldname/newname/g
9.2 在多行行尾加分号
vim
:%normal A;
或块选择：

vim
Ctrl-v               " 进入块模式
G                    " 到文件尾
$                    " 到行尾
A;                   " 在所有选中行尾加分号
Esc
9.3 注释多行（Python）
vim
Ctrl-v               " 进入块模式
j5                   " 向下选 5 行
I#                   " 在所有选中行首插入 #
Esc
9.4 删除多行
vim
5dd                  " 删除 5 行
9.5 移动多行
vim
V                    " 行选择
3j                   " 选 3 行
:move +5             " 向下移动 5 行
9.6 排序
vim
:sort                " 排序
:sort!               " 反向排序
:sort u              " 去重排序
9.7 数字递增
vim
:let i=0
:g/^/s//\=i/|let i=i+1
或：

vim
:put =range(1,100)
9.8 大小写转换
vim
guw                  " 当前词转小写
gUw                  " 当前词转大写
guu                  " 当前行转小写
gUU                  " 当前行转大写
g~w                  " 当前词反转大小写
9.9 文件编码转换
vim
:e ++enc=gbk         " 以 GBK 编码打开
:set fenc=utf-8      " 设置输出编码
:w                   " 保存为 utf-8
9.10 十六进制查看
vim
:%!xxd               " 转为十六进制
:%!xxd -r            " 转回二进制
10. 风险提醒
:w! 强制写只读文件：可能改错配置

:q! 强制退出不保存：丢失改动

:set 选项设错：可能影响正常编辑

替换命令没有 /g：只替换每行第一个

替换命令没有 /c：批量替换可能改错

宏录制后立即全文件执行：可能造成大范围改动

不备份改配置文件：改错无法恢复

在大文件上录制宏：可能很慢

块选择后用错命令：可能错删

:! 执行破坏性命令：可能误操作

误按 Ctrl-z：vim 被挂起到后台

误按 Ctrl-s：vim 被锁定（Ctrl-q 解锁）

误删字符 u 撤销后又 Ctrl-r 重做：可能搞混历史

改 .vimrc 后未 source：以为生效实际未生效

用方向键破坏肌肉记忆

11. 验证方式
模式切换是否能丝滑

hjkl 移动是否流畅

数字 + motion 是否熟练

搜索替换是否正确

块选择能否多行编辑

宏能否批量处理

.vimrc 是否正确加载

配色是否符合预期

自动补全是否正常

配置文件改完后业务是否正常

12. 回滚方案
12.1 改配置文件回滚
bash
cp /etc/my.cnf.bak /etc/my.cnf
12.2 改 .vimrc 回滚
bash
cp ~/.vimrc.bak ~/.vimrc
12.3 Vim 内撤销
vim
u                    " 撤销
:earlier 5m          " 回到 5 分钟前
12.4 替换回滚
vim
:undo                " 撤销替换
12.5 宏回滚
录制宏后未执行前，用 u 撤销。

12.6 块编辑回滚
vim
u
12.7 插件回滚
bash
mv ~/.vim ~/.vim.bak
git clone <plugin repo> ~/.vim
12.8 配色回滚
vim
:colorscheme default
12.9 全部撤销
vim
:q!
:e!
12.10 文件级回滚
bash
git checkout file
13. 生产环境注意事项
生产环境改配置文件要备份

用 vim 改 nginx/apache/my.cnf 等要小心

改完要 reload/restart 前必须验证

改完要业务测试

多人共用服务器时 .vimrc 要统一

在容器内使用 vim 可能没有高亮

远程服务器 vim 版本可能很老

远程 vim 可能没有 clipboard 寄存器

修改 systemd unit 要 systemctl daemon-reload

修改 cron 要 crontab -e 不要改 /etc/crontab 后忘重启

不要在 vim 内直接执行破坏性 :! 命令

改完立即 :w + 备份

14. 总结
Vim 是工具，肌肉记忆是熟能生巧。这 20 个技巧是杠杆最高的起点，每天练 10 分钟，三周就能定型：

模式切换 i/a/o + ESC

hjkl 移动

词移动 w/b/e

行内 0/$/^

文件级 gg/G

字符查找 f/F/t/T

删除 d

复制 y

粘贴 p

撤销 u

搜索 /

替换 :s

可视化 v/V/Ctrl-v

缩进 >>/<<

插入模式 Ctrl 键

寄存器 "

宏 q + @

窗口 :split / :vsplit

:! 执行 shell

:set 配置

把这 20 个练熟，再根据自己的工作场景拓展。Vim 是越用越快、越用越顺的工具，前期慢一点没关系，三个月后会感谢自己。

15. 进阶方向
15.1 文本对象深入
vim
ci"                  " 改双引号内
ci'                  " 改单引号内
ci(                  " 改括号内
ci[                  " 改中括号内
ci{                  " 改大括号内
cit                  " 改 HTML tag 内
di"                  " 删双引号内
yi"                  " 复制双引号内
va(                  " 选含括号的内容
15.2 命令模式的高级用法
vim
:read !date                     " 读入日期
:%!python -c "..."              " 用外部命令处理
:g/pattern/d                    " 删除匹配行
:v/pattern/d                    " 删除不匹配行
:g/pattern/s/old/new/           " 匹配行内替换
:'<,'>!column -t                " 格式化对齐
15.3 寄存器的进阶用法
vim
:let @a = "long text"           " 设置寄存器
:let @a = ""                    " 清空寄存器
"ayw                            " 复制到 a
:put a                          " 粘贴 a
15.4 表达式寄存器
vim
"=1+2<CR>p                      " 粘贴计算结果
"=system('date')<CR>p           " 粘贴命令输出
15.5 自动命令深入
vim
autocmd FileType python nmap <buffer> <F5> :!python %<CR>
autocmd BufWritePost *.py !python -m py_compile %
autocmd InsertLeave * set cul
autocmd InsertEnter * set nocul
15.6 状态行自定义
vim
set statusline=%f\ %y\ %m\ %r\ %=Line\ %l\/%L\ Col\ %c
15.7 命令补全
vim
:command -nargs=* MyCmd echo <q-args>
15.8 函数
vim
:function! Hello()
:  echo "Hello"
:endfunction
:call Hello()
15.9 插件入门
推荐新手友好的插件：

vim-commentary（注释）

vim-surround（包围符）

vim-repeat（重复 operator）

nerdtree（文件树）

fzf.vim（模糊搜索）

coc.nvim / YouCompleteMe（补全）

vim-airline（状态栏）

vim-gitgutter（git 标记）

15.10 学习路径
一周：掌握 20 个肌肉记忆

两周：熟悉 .vimrc 配置

一月：掌握插件使用

三月：根据自己的工作流定制

16. 推荐配置与工具
16.1 vim-plug 插件管理
vim
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf.vim'
call plug#end()
16.2 实用搜索工具
ack

ag (silver searcher)

rg (ripgrep)

fzf

16.3 远程编辑
ssh + vim

scp + vim

rsync + vim

vim + netrw（内置）

16.4 IDE 替代品
SpaceVim

LunarVim

NvChad

AstroVim

17. Vim 与其他工具搭配
17.1 Vim + tmux
tmux 分屏 + vim 分屏，编辑器与终端双分屏。

17.2 Vim + fzf
fzf 模糊搜索文件，vim 编辑。

17.3 Vim + ripgrep
vim
:grep! -n pattern %
:copen
17.4 Vim + git
vimdiff：git difftool

vim-fugitive：vim 内 git

gv.vim：commit browser

17.5 Vim + SSH
bash
vim scp://user@host//etc/my.cnf
vim 内置 netrw 支持 scp 编辑。

18. 典型场景的 vimrc 模板
18.1 运维工程师 vimrc
vim
set nocompatible
syntax on
filetype plugin indent on

set number relativenumber cursorline scrolloff=5

set tabstop=2 shiftwidth=2 expandtab

set ignorecase smartcase incsearch hlsearch

set history=1000 undolevels=1000

" 运维相关映射
nnoremap <F5> :!bash %<CR>
nnoremap <F6> :!./%<CR>

" 文件类型
autocmd FileType sh setlocal tabstop=2 shiftwidth=2
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2
autocmd FileType nginx setlocal commentstring=#\ %s

" 自动保存
autocmd BufWritePre *.sh !shfmt -i 2 -w %
18.2 DBA vimrc
vim
set tabstop=4 shiftwidth=4 expandtab

" SQL 高亮
autocmd FileType sql setlocal commentstring=--\ %s

" 大写关键字
nnoremap <leader>u :s/\b\(SELECT\|FROM\|WHERE\|JOIN\)\b/\U\1/g<CR>
18.3 开发者 vimrc
vim
" 通用配置
set nocompatible
syntax on
filetype plugin indent on

set number relativenumber cursorline scrolloff=5
set tabstop=4 shiftwidth=4 expandtab
set ignorecase smartcase incsearch hlsearch

" 代码折叠
set foldmethod=indent
set foldlevel=2

" 自动补全
set completeopt=menuone,noinsert,noselect
set omnifunc=syntaxcomplete#Complete
19. 面试常见 Vim 问题
Q：Vim 有几种模式？
A：4 种：Normal、Insert、Visual、Command，还有 Replace。

Q：如何从 Insert 模式快速回 Normal？
A：ESC 或 Ctrl-[。

Q：如何跳到行首/行尾？
A：0 行首、$ 行尾、^ 第一个非空白字符。

Q：如何跳到文件头/文件尾？
A：gg / G。

Q：如何搜索替换？
A：/pattern + n/N；:s/old/new/g。

Q：如何复制粘贴？
A：yy / p；"+y / "+p 跨系统剪贴板。

Q：如何录制宏？
A：q + 字母，操作，q，@ + 字母执行。

Q：如何分屏？
A：:split 水平、:vsplit 垂直，Ctrl-w 切换。

Q：如何块编辑？
A：Ctrl-v 进入块模式。

Q：如何快速注释？
A：Ctrl-v 选行，I//，Esc。

20. 写在最后
Vim 是工具，肌肉记忆是技能。每天花 10 分钟，把这 20 个技巧练熟，遇到常用的操作就用 Vim 而不是方向键，三周就能定型。

Vim 的学习曲线前期陡峭，但一旦过去就一劳永逸。比 IDE 更快、比 nano 更强、比 sed 更友好，是运维、DBA、开发者都该掌握的工具。

记住一句话：肌肉记忆不是背下来的，是用出来的。

打开 Vim，用 hjkl 移动，用 / 搜索，用 :s 替换，用 dd 删除。十天之后，你会感谢现在的自己。

21. 每个技巧的实战场景
21.1 技巧 1（i/a/o/O/I/A）
场景 1：在文件第 5 行末尾加注释。

vim
gg
4j
A
# 这是注释
Esc
场景 2：在文件中间插入一段。

vim
50G
o
新内容
Esc
21.2 技巧 2（hjkl）
场景 1：上下移 1 行。j：下移，k：上移。
场景 2：左右移动。h：左移，l：右移。

21.3 技巧 3（w/b/e）
场景 1：在长变量名之间跳转。w 跳到下一个词。
场景 2：在代码中跳到下一个函数。反复按 w。

21.4 技巧 4（0/$/^）
场景 1：在长行中快速到行尾。$ 比 End 键快。
场景 2：从行尾回到行首。0 直接到行首。

21.5 技巧 5（gg/G）
场景 1：查看文件总行数。G 然后 Ctrl-g。
场景 2：到指定行。100G 到第 100 行。

21.6 技巧 6（f/F/t/T）
场景 1：在 SQL 中跳到 WHERE 关键字。fW。
场景 2：删除到分号。df;。

21.7 技巧 7（d）
场景 1：删除一行。dd。
场景 2：删除一个词。dw（光标在词首）或 daw（任何位置）。
场景 3：删除到行尾。D 或 d$。

21.8 技巧 8（y）
场景 1：复制一行。yy。
场景 2：复制一个词。yw。
场景 3：复制多行。5yy。

21.9 技巧 9（p/P）
场景 1：复制后粘贴。yyp。
场景 2：从寄存器粘贴。"ayy，"ap。

21.10 技巧 10（u）
场景 1：撤销最近改动。u。
场景 2：重做。Ctrl-r。

21.11 技巧 11（/）
场景 1：搜索关键字。/keyword Enter。
场景 2：搜索当前光标下的词。*（向下）或 #（向上）。

21.12 技巧 12（:s）
场景 1：替换所有。:%s/old/new/g。
场景 2：替换并确认。:%s/old/new/gc。

21.13 技巧 13（v/V/Ctrl-v）
场景 1：选择 5 行注释。V 然后 4j，然后 I#，然后 Esc。
场景 2：在多行末尾加分号。Ctrl-v 然后 4j，然后 A; 然后 Esc。

21.14 技巧 14（>）
场景 1：缩进当前行。>>。
场景 2：缩进多行。V 选中，>。

21.15 技巧 15（Ctrl 键）
场景 1：删除刚输入的词。Ctrl-w。
场景 2：撤销最近删除。Ctrl-r。

21.16 技巧 16（" + 字母）
场景 1：复制到 a，剪切到 b。"ayy，"bdd，"ap。
场景 2：保留原剪切板内容。"_d（删到黑洞）。

21.17 技巧 17（q + 字母）
场景 1：把每行加 .bak。qa I.bak Esc q，:%normal @a。
场景 2：批量格式化。qa 录制格式化动作 q，:%normal @a。

21.18 技巧 18（窗口）
场景 1：左右分屏。:vsplit + 文件名。
场景 2：在窗口间跳转。Ctrl-w + h/j/k/l。

21.19 技巧 19（:!）
场景 1：插入当前时间。:r !date。
场景 2：执行命令。:!ls。

21.20 技巧 20（:set）
场景 1：行号。:set nu。
场景 2：自动缩进。:set autoindent。

22. Vim 在不同场景下的实战
22.1 改 nginx 配置
vim
/etc/nginx/nginx.conf
:1
/worker_processes
dw
i4
Esc
:w
:!nginx -t
22.2 改 my.cnf
vim
/etc/my.cnf
/innodb_buffer_pool_size
daW
i8G
Esc
:w
22.3 看日志并标记异常
vim
/var/log/messages
/ERROR
n
:bn
22.4 改 K8s manifest
vim
deployment.yaml
/containers
j
/image:
ciw
Esc
22.5 批量改配置
vim
:%s/localhost/db.internal/g
:%s/127.0.0.1/db.internal/g
22.6 临时加注释
vim
:s/^/# /
:%s/^/# /
:%s/^# //
22.7 调整缩进
vim
:1,20>>
:20,$<<
gg=G
22.8 合并行
vim
J
3J
gJ
22.9 多文件编辑
vim
vim a.txt b.txt c.txt
:bn
:bp
:ls
:b 2
:bd
22.10 远程编辑
vim
:e scp://user@server//etc/my.cnf
:w !sudo tee %
23. Vim 隐藏神器
23.1 Ctrl-r 寄存器（插入模式下）
vim
Ctrl-r "
Ctrl-r a
Ctrl-r +
Ctrl-r =
23.2 gq 格式化
vim
gqq
gq}
:set formatoptions+=a
23.3 :try / :catch
vim
:try
:  /pattern
:catch /^Vim:E/
:  echomsg "pattern not found"
:endtry
23.4 :set list
vim
:set list
:set listchars=eol:$,tab:>-,trail:·,nbsp:_
23.5 :set path
vim
:set path+=**
:find filename
:gf
23.6 :args 文件列表
vim
:args *.txt
:next
:prev
23.7 :cfile 错误列表
vim
:grep -r pattern .
:copen
:cnext
23.8 :DiffOrig
vim
:DiffOrig
:Diffoff
23.9 :w !sudo tee %
vim
:w !sudo tee %
:!chmod 644 %
23.10 :Termdebug（vim 8.1+ 内置 debug）
vim
:packadd termdebug
:Termdebug
24. Vim 高效组合键
组合	效果
:%s/foo/bar/g	全文替换
gg=G	全局缩进
:v/^$/,/^$/-j!	多行合并为一行
:%s/,/<CR>/g	多行拆分为多行
:g/^$/d	删除空行
:sort u	删除重复行
:g/^/m0	反转行
:g/^/s/.*/\U&/	大小写反转
:put =eval(getline(1,'$'))	数字求和
:'<,'>s/.*/\=eval(submatch(0))/	计算当前列数字之和
25. Vim 与 Git 协作
25.1 vimdiff 作为 git difftool
bash
git config --global diff.tool vimdiff
git diff
25.2 vim-fugitive
vim
:Git status
:Git diff
:Git commit
:Git log
:Git blame
25.3 gv.vim
vim
:GV
25.4 提交时编辑 message
bash
git config --global core.editor "vim"
25.5 在 vim 内做 code review
vim
:tabnew file
:vsp file.bak
Ctrl-w + h/l
26. 故障排查思路
26.1 Vim 启动报错
bash
vim -u NONE
vim -u NONE -N
排查 .vimrc 问题。

26.2 插件冲突
bash
mv .vim .vim.bak
git clone <plugin repo> .vim
26.3 快捷键不生效
vim
:verbose map <key>
查看快捷键来源。

26.4 高亮丢失
vim
:syntax on
:filetype on
26.5 中文乱码
vim
:set encoding=utf-8
:set fileencoding=utf-8
:set termencoding=utf-8
26.6 中文宽度
vim
:set ambiwidth=double
26.7 删除键问题
vim
set backspace=indent,eol,start
26.8 方向键问题（A 字母乱出）
Vim 兼容模式：set nocompatible。

26.9 Ctrl-S 锁定
按 Ctrl-Q 解锁（Ctrl-S 是终端的 XOFF）。

26.10 编辑大文件卡
vim
:set lazyredraw
:set undolevels=-1
:set noswapfile
27. 运维工程师的 vimrc 推荐
vim
set nocompatible
set encoding=utf-8
set fileencoding=utf-8
syntax on
filetype plugin indent on

set number relativenumber
set cursorline
set scrolloff=5
set laststatus=2
set showcmd
set ruler

set ignorecase
set smartcase
set incsearch
set hlsearch
nnoremap <Esc><Esc> :nohlsearch<CR>

set tabstop=2 shiftwidth=2 expandtab
set autoindent
set smartindent

set history=1000
set undolevels=1000

autocmd FileType sh setlocal tabstop=2 shiftwidth=2
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2
autocmd FileType python setlocal tabstop=4 shiftwidth=4
autocmd FileType json setlocal tabstop=2 shiftwidth=2

nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a
nnoremap <C-q> :wq<CR>
nnoremap <F5> :!bash %<CR>
nnoremap <F6> :!./%<CR>
nnoremap <C-j> 5j
nnoremap <C-k> 5k

autocmd BufWritePre *.sh !shfmt -i 2 -w %
autocmd BufWritePre *.yaml !python -c"import yaml,sys; yaml.safe_load(open(sys.argv[1]))" %

set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

colorscheme desert
syntax on
28. 行动计划与资源
28.1 行动计划
阶段	内容
第 1-3 天	练模式切换 + hjkl + 基础移动
第 4-7 天	练 d/y + 数字前缀
第 8-14 天	练 w/b/e、0/$/^、gg/G、f/F/t/T
第 15-21 天	练搜索、替换、可视化、缩进
第 22-30 天	练寄存器、宏、窗口、配置文件
28.2 配套练习
用 vim 改 100 个配置文件

用 vim 改 100 个 shell 脚本

用 vim 写 100 个 Markdown 文档

用 vim 处理 100 个日志文件

28.3 检验标准
30 秒内能用 vim 完成任意编辑任务

能用宏批量处理 100 行

能用块编辑改多行

能用 :! 执行命令并插入结果

能用 netrw 远程编辑

28.4 推荐资源
vimtutor：vim 自带教程（必学）

:help：vim 帮助（详尽）

vim help tags：标签搜索

Practical Vim（书籍）

vimcasts.org（视频）

Brendan Gregg vim 配置

28.5 持续学习
Vim 是终身学习的工具。每天学一个新技巧，每月读一篇高级用法，每年读一遍 :help，都会让 vim 更顺手。

把 vim 用熟，比 IDE 更纯粹，比 nano 更强大，比 sed 更友好。