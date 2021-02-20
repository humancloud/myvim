"============================================================================
"			导入vimrc要做的事情
"         1. 安装python-pynvim和nvim和jedi : pip install pynvim  pip install jedi pacman -S nvim
"         2. taglist插件还需要安装ctags  : pacman -S ctags
"         3. astyle 和 clang
"         4. font: Hack    size: small size is good
"         5. 如果出现问题,可以将plugged目录赋予较高权限
"============================================================================

" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif


" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


"设置leader键
let g:mapleader=","


"------------------o----------------vimplug-----------------o-----------------
"所有插件都在 ~/.vim/plugged
call plug#begin('~/.vim/plugged')
"vim-startify
Plug 'mhinz/vim-startify'


""""""""""""""""""""""""""""""""""""""""""""
"         代码补全                         "
"         ctrl n ctrl p 上下选择           "
""""""""""""""""""""""""""""""""""""""""""""
"coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 安装插件后配置json,安装languageserver, C系列安装clang,Python系列:
" pip install language-server ,Go安装gopls


"vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


"neoformat
"输入Neoformat即可格式化
Plug 'sbdchd/neoformat'

"cpp什么高亮插件,也不知道咋样,从vimawsome找的,喜欢的人很多
Plug 'octol/vim-cpp-enhanced-highlight'

"TagBar 显示大纲
Plug 'preservim/tagbar'

"airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"输入NERDTree就可以打开目录树
Plug 'scrooloose/nerdtree'


Plug 'tpope/vim-surround'
"vim-surround成对编辑和删除功能比下面更强大,但下面输入括号更舒服方便
"2.1 命令行模式
"ds                删除一个配对符号 (delete a surrounding)     
"     example:   (hello) 在光标上按ds,然后输入(就删除了括号,"hello"一样
"cs                更改一个配对符号 (change a surrounding)
"	  example:   (hello) 要改成"hello", 光标在hello输入cs,然后输入(,输入"即可
" 增加符号不常用
" Hello world! 现在将光标放在“Hello”上，按ysiw],变成 [Hello] world, 然后按cs]{  变成{Hello} world, 
"
" { Hello } world 现在，用yssb或将整个行用括号括起来yss), ( {Hello} world )  要恢复为原始文本：按ds{ ds)
"

"括号成对编辑
Plug 'jiangmiao/auto-pairs'


"按gc注释 gcgc取消注释
Plug 'tpope/vim-commentary'
"代码缩进线适合python
Plug 'yggdroot/indentline'

" 显示修改,gitgutter
Plug 'airblade/vim-gitgutter'

" 模糊搜索文件
Plug 'kien/ctrlp.vim'


"配色插件
Plug 'zefei/cake16'
Plug 'w0ng/vim-hybrid'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
"有dark和light,都不错
Plug 'liuchengxu/space-vim-theme'  
"大名鼎鼎的solarized8
Plug 'lifepillar/vim-solarized8'
"seoul256
Plug 'junegunn/seoul256.vim'
"yowish
Plug 'KabbAmine/yowish.vim'

"leader k高亮单词,
"leader K取消高亮,
"n N 到下一个高亮的单词
Plug 'lfv89/vim-interestingwords'

"vim Markdown
Plug 'iamcco/markdown-preview.vim'
"添加数学公式支持
Plug 'iamcco/mathjax-support-for-mkdp'

"bufferonly
"输入:BufOnly 即可清除其他buffer
Plug 'vim-scripts/BufOnly.vim'


call plug#end()
"-----------------o-------------------End-------------------o-----------------




"------------o-----------all plugins configuration-------------o---------------

" vim-go need gopls
let g:go_def_mode = 'gopls'


"coc补全
"这个很好用,但是我想还是觉得原生vim更好,而且每次启动都要启动language server (所以在配置里去掉了C/Cpp的配置,使用:CocConfig可以修改配置)
"功能很强大，还需要继续挖掘
"
"TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion, ctrl space 触发补全??
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
" 跳转到定义，类型定义，实现，引用
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" K 显示文档
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
" 标志重命名(重构用的)
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code. leader f 格式化选中的代码
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" 自动修复问题
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"CocList 功能的映射，暂时用不到此功能
" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


"Neoformat C 配置,
"由于安装了clang,所以它默认会使用clang-format来格式化C代码,但是真的很难用,所以这里指定一下
"格式化C: pacman install astyle ,格式化其他应该也需要其他的相应软件包
let g:neoformat_enabled_c = ['astyle']
let g:neoformat_enabled_cpp = ['astyle']
let g:neoformat_enabled_python = ['yapf']


"airline配置
let g:airline#extensions#tabline#enabled = 1 		  "设置一直显示上方的tabline
let g:airline_powerline_fonts = 1   		          "这个是安装字体后 必须设置此项" 
let g:airline#extensions#tabline#buffer_nr_show = 1   "设置显示buffer的编号"
" 映射<leader>num到num buffer,快速切换buffer
nnoremap <leader>1 :b 1<CR>
nnoremap <leader>2 :b 2<CR>
nnoremap <leader>3 :b 3<CR>
nnoremap <leader>4 :b 4<CR>
nnoremap <leader>5 :b 5<CR>
nnoremap <leader>6 :b 6<CR>
nnoremap <leader>7 :b 7<CR>
nnoremap <leader>8 :b 8<CR>
nnoremap <leader>9 :b 9<CR>
"映射左右切换buffer
nnoremap ]b :bn<CR>
nnoremap [b :bp<CR>
"映射快速关闭当前buffer
nnoremap <leader>b :bd<CR>
"设置主题
let g:airline_theme="wombat" 
"主题
" badwolf 和dark差不多 
" base16 银，紫 
" behelit 浅蓝
" bubblegum 暗绿，粉。          (我的推荐)
" dark 亮黄
" durant 比dark暗些
" hybrid 灰
" hybridline 绿，棕
" jellybeans 黑灰
" kalisi 暗黄，绿
" kolor 蓝色的
" laederon 银，红
" light 浅亮蓝，红，银
" lucius 灰，银
" luna 蓝绿色
" molokai 棕，蓝，橙
" monochrome
" murmur 蓝，橙
" papercolor 银，浅蓝
" powerlineish 暗黄，橙
" raven 灰
" serene 黑
" silver 太银了，深绿
" simple 亮蓝
" sol 银，深蓝
" solarized 太多色了
" term 绿，蓝
" tomorrow 
" ubaryd
" understated
" wombat 亮黄
" zenburn 蓝，橙


"NerdTree
" 映射打开目录树,关闭目录树
nnoremap <leader>n :NERDTreeToggle<CR> 
" 更新目录树，(创建新文件后不会自动更新目录树)
nnoremap <leader>r :NERDTree<CR>
"定位当前打开的文件在目录树中的位置
nnoremap <leader>v :NERDTreeFind<CR>


"TagBar configuration
nnoremap <leader>t :TagbarToggle<CR>


"cpp enhanced highlight配置(高亮显示Cpp的类等)
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1


"auto pairs 配置括号成对编辑
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"'}


"ctrlp 搜索文件
let g:ctrlp_map = '<C-p>'
"-----------------o-------------------End-------------------o------------------


"---------------o----------------vim配色与主题---------------o----------------

"设置256配色，这个要放在colorscheme前面
let g:solarized_termcolors=256
set termguicolors  "设置真彩色
set background=dark "背景为暗色

colorscheme hybrid
"colorscheme gruvbox 
"colorscheme space_vim_theme

"solarized配置
"colorscheme solarized8

" colorscheme molokai
" let g:molokai_original = 1
" let g:rehash256 = 1

"seoul256主题
"colorscheme seoul256

"yowish
"colorscheme yowish

"onedark
"colorscheme onedark
"-----------------o-------------------End-------------------o------------------




"---------------o----------------vim自带功能配置---------------o---------------
"显示未敲完的命令
set showcmd		    " Show (partial) command in status line.
set showmatch		" Show matching brackets.
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set mouse=a		    " Enable mouse usage (all modes)
set ruler			" 右下角显示光标的坐标
set cursorline		" 突出显示当前行
set smartindent		" 设置智能自动缩进
set nu 				" 行号
set hlsearch        " 高亮搜索
set ignorecase		" 搜索忽略大小写
set tabstop=4		" 设置tab键大小
set shiftwidth=4	" 设置缩进长度

"vim 打开后光标停在上次退出时光标的位置
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
"-----------------o-------------------End-------------------o------------------




"---------------o----------------vim中的一些映射---------------o---------------
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
"
"好几个插件的自带配置的映射，我修改成了合适的，比较喜欢nnoremap





"Nomal Mode

"1. switch window
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k





" Insert Mode

"插入模式下leader w 保存文件
inoremap ,w <esc>:w<CR>

"插入模式下任意位置直接切到新的一行
inoremap <C-j> <C-o>o

"插入模式跳转到行尾
inoremap <C-l> <C-o>A  


"还有插件里的一些映射
"例如NerdTree的映射,air-line的切换buffer映射，非常方便
""-----------------o-------------------End-------------------o------------------
