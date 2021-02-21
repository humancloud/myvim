"******************************************************************************
"*************************vim技巧以及命令**************************************
"******************************************************************************

" https://github.com/skywind3000/awesome-cheatsheets/blob/master/editors/vim.txt
" 里面有一些vim技巧
"不要使用vim打开大文件,vim会一次性读取所有内容到内存,100M以下为宜


"===============================================
"   			宏录制
"   	录制: 按q加上宏名字开始录制,按q停止录制
"   	运行: @加宏名字运行一次, 按次数加@宏名运行多次
"
"   	使用宏生成序列号: insert模式下输入 "101."
"   	按q加名字开始录制,将光标移动到101.上面,然后按yy 按p ,然后按ctrl a
"   	将第二行的值增加到102,然后按q停止录制,就录制好了.按8@宏名字,序列号自动增加
"===============================================



"===============================================
"              vim书签以及跳转功能
"===============================================
"
" %在括号匹配之间跳转
" ctrl ] 跳转到定义 ,需要ctags  pacman -S ctags,然后需要在源文件目录下执行 ctags -R 生成一个tags文件,这个文件就是所有函数和变量的索引列表
"
" nomal模式下m然后输入一个字符,就在光标处建立了一个书签,使用`加刚刚输入的字符就可以跳转回来
" 可以输入:marks查看所有书签
" :delm!              删除所有缓冲区标签(小写字母), 不能删除文件标签和数字标签
" :delm A-Z           删除所有文件标签(大写字母)
" :delm 0-9           删除所有数字标签(.viminfo)
" :delm A-Z0-9        删除所有文件标签和数字标签

" 在光标所在单词上按#立即跳转到上一个一样的单词那里,*号跳转到下一个一样的单词那里.


" =============================================================================
"			Nomal模式
" =============================================================================
" ctrl v 块选择,可以用来给代码多行注释
" gd 跳转到局部定义 不用ctags
" gf 跳转到文件
" ctrl o 跳转到上一个跳转位置   这个很重要,  不管怎么跳转,都可以ctrl o 跳转回来
" ctrl i 到下一个跳转位置
" ctrl b 查看上一页内容  常用
" ctrl f 查看下一页内容  常用
" K 跳转到manul
" A 跳转到行尾并进入编辑模式
"   
" << 左缩进
" >> 右缩进
" == 自动缩进 原来还可以这样
"
" 0到行首
" ^ 跳转到行首第一个非空字符
" $到行尾
" % 匹配括号移动
" gg到第一行行首
" G 到最后一行的行尾
" 100G 跳转到100行行首 , 比命令模式输入:行号方便
" 
" 
" y$复制到行尾
" yw 复制一个单词
" yy 复制一整行
" 10yy 复制光标下10行
" yG 复制到文本结束
" yH 从文本开始复制到光标处
"
"
" x 删掉光标处字符
" 3x剪切三个
" p 光标之后粘贴
" P光标之前粘贴
" 3p粘贴三次
" 
"
" fa移动光标到本行下第一个字符a处, 2fa移动到第二个a处
" Fa移动到上一个字符a
" nfa 移动到第n个字符处
" nFa
"
" yfa 复制光标字符到字符a之间的内容
" y2fa 复制光标字符到第2个a之间的内容
"
" 
" dw  删除一个单词 (很常用)
" d2w 删除两个单词
" df" 删除到出现第一个双引号的位置
" d2f" 删除到出现第2个双引号的位置
" d$ 删除到本行结尾
" d^  删除到本行开头
" dH 同yH
" dG 同yG 
" dtg 删除到g字符的位置不删除g字符 (例如abcdegfhijk) 按键dtg从光标删除到g字符,
" 其实就是delete to g 的缩写很好用啊
"
" f{ 移动到大括号处,然后d%删除整个大括号的内容(包括大括号), 或者di{
" 删除大括号里面的内容,不删除大括号
"
" u 撤销操作
" ctrl r 恢复撤销操作
"
" ~ 将光标处的字符改变大小写
" 3~ 将光标位置开始的3个字符改变其大小写
" g~~ 改变当前行字符大小写
" gUU 当前行字符改成大写
" guu 当前行改成小写
" gUw 光标处的单词改成大写
" guw 光标处的单词改成小写
"
"
" 替换:
"  r 替换光标处字符
"  S替换行(删除当前行,并进入插入模式)
"  cc 同 S
"  ciw改写光标所处的单词
"  caw改写光标所处的单词(如果两侧有空格删除空格)
"  c0                  从光标改写到行首
"  c^                  从光标改写到行首（第一个非零字符）
"  c$                  从光标改写到行末
"  C                   从光标改写到行尾（同c$）
"  ci"                 改写双引号中的内容
"  ci'                 改写单引号中的内容
"  cib                 改写小括号中的内容
"  cab                 改写小括号中的内容（包含小括号本身）
"  ci)                 改写小括号中的内容
"  ci]                 改写中括号中内容
"  ciB                 改写大括号中内容
"  caB                 改写大括号中的内容（包含大括号本身）
"  ci}                 改写大括号中内容
"  c2w                 改写下两个单词
"  ct(                 改写到小括号前
"  c/apple             改写到光标后的第一个apple前


" =============================================================================
" 底行命令模式
" =============================================================================
" :%!xxd 16进制
" :s/$/sth 行尾追加sth
" :g/^/s*$/d 删除空行以及只有空格的行
"
" 替换
" :s/from/to	当前行第一个from替换成to
" :s/from/to/g  当前行所有from替换成to
" :33s/from/to/g 在第33行进行替换操作 
" :%s/from/to/g  对所有行内容进行替换	


" =============================================================================
" Insert模式
" =============================================================================
" I 进入编辑,并将光标置于行首
" A 置光标与行尾并进入插入模式(在行尾插入)
" O 当前行上面新加一行,进入插入模式
"
" insert 模式  ctrl [ 相当于esc 但比esc更顺手
" ctrl d crtl t 左右缩进
" ctrl u 重新编辑本行
" ctrl w 删除单词
" 
"
" 插入模式快捷键
" CTRL-M 或 CTRL-J				  开始新行
" CTRL-E		  插入光标下方的字符
" CTRL-Y		  插入光标上方的字符
" CTRL-A		  插入上次插入的文本
" CTRL-@		  插入上次插入的文本并结束插入模式
" CTRL-R {0-9a-z%#:.-="}	插入寄存器的内容
" CTRL-W		  删除光标前的一个单词
" CTRL-U		  删除当前行的所有字符
" CTRL-T		  在当前行首插入一个移位宽度的缩进
" CTRL-D		  从当前行首删除一个移位宽度的缩进
" 0 CTRL-D	  删除当前行的所有缩进
" ^ CTRL-D	  删除当前行的所有缩进，恢复下一行的缩进
"
" <S-Left>            按住 SHIFT 按左键，向左移动一个单词
" <S-Right>           按住 SHIFT 按右键，向右移动一个单词
" <S-Up>              按住 SHIFT 按上键，向上翻页
" <S-Down>            按住 SHIFT 按下键，向下翻页
"
" =============================================================================
"
"
" vim 缩进大法
"
" 缩进4个格  1,18> 1到18行向右缩进4格,       <向左缩进4空格
"
" 缩进自定义个格
" ctrl v 进入visual block模式, 选择块, 按I
" ,按1个空格,按esc键就可以整个块向右缩进1格
"
" 按几个空格缩进几个格,
" 甚至不输入空格而是输入字符,都会使得整个块每一行前面都加上这几个字符(其实输入空格就是在开头添加空格,输入字符就是添加字符)
"
" :nohlsearch 取消搜索高亮
"
"
"
"
"
"
"
"
" =============================================================================
" vim 映射
"
"
"noremap是不会递归的映射 (大概是no recursion)
"例如
"noremap Y y
"noremap y Y
"不会出现问题,按Y代表y,按y代表Y
"而
"map Y y
"map y k
"按Y时就是k
"
"
"前缀代表生效范围
"inoremap就只在插入(insert)模式下生效
"vnoremap只在visual模式下生效
"nnoremap就在normal模式下生效
"

