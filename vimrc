"---------------o----------------vim 非插件配置---------------o---------------
syntax on           " 开启语法高亮
set showcmd		    " 状态栏显示未写完的命令
set showmatch		" 显示匹配的括号
set smartcase		" 智能大小写匹配
set incsearch		" 渐进式查找
set mouse=a		    " 所有模式下启用鼠标
set ruler			" 右下角显示光标的坐标
set cursorline		" 突出显示当前行
set smartindent		" 设置智能自动缩进
set nu 				" 行号
set hlsearch        " 高亮搜索
set ignorecase		" 搜索忽略大小写
set tabstop=4		" 设置tab键大小
set shiftwidth=4	" 设置缩进长度
set encoding=UTF-8

" 设置vim 打开后光标停在上次退出时光标的位置
" vim默认使用~/.viminfo保存和记录每个用户的运行记录，
" 如在vim内执行的历史命令、每个曾编辑过的文件上次退出时光标位置等，
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"设置leader键
let g:mapleader=","

"切换窗口
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

"leader w 保存文件
inoremap ,w <esc>:w<CR>

"插入模式下向下开辟新一行
inoremap <C-j> <C-o>o
"插入模式下向上开辟新一行
inoremap <C-k> <C-o>O

"还有插件里的一些映射
"例如NerdTree的映射,air-line的切换buffer映射，非常方便
"好几个插件的自带配置中的映射，我修改成了合适的，比较喜欢nnoremap
"还删除了一些插件自带的不必要的配置，文件已经比较精简
"-----------------o-------------------End-------------------o------------------


"------------------o----------------vimplug-----------------o-----------------
"所有插件都在 ~/.vim/plugged
call plug#begin('~/.vim/plugged')

"vim-startify
Plug 'mhinz/vim-startify'
"coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 安装后执行 :CocConfig 修改JSON文件，决定开启哪些语言
" C/C++语言补全，安装clang即可
" Python补全，pip install language-server 
" Go补全，安装gopols即可，安装vim-go,自动就装好了

"vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" 设置代理(安装需要外网，所以为Golang设置国内代理)后直接安装或更新插件或者执行:GoInstallBinaries，然后vim-go需要的gopols,golint等就安装好了

"Neoformat
" :Neoformat 格式化
Plug 'sbdchd/neoformat'

"Cpp语法高亮插件
Plug 'octol/vim-cpp-enhanced-highlight'

"TagBar
Plug 'preservim/tagbar'

"Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"NerdTree
Plug 'scrooloose/nerdtree'

"AutoPairs 自动补全另一个括号或引号
Plug 'jiangmiao/auto-pairs'

"gc注释 gcgc取消注释
Plug 'tpope/vim-commentary'

"Indentline 代码缩进线
Plug 'yggdroot/indentline'

"模糊搜索文件
Plug 'kien/ctrlp.vim'

"配色插件
Plug 'w0ng/vim-hybrid'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
"space_vim_theme light 和 dark 都不错
Plug 'liuchengxu/space-vim-theme'  
Plug 'lifepillar/vim-solarized8'
Plug 'KabbAmine/yowish.vim'

"leader k高亮单词,
"leader K取消高亮,
"n N 到下一个高亮的单词
Plug 'lfv89/vim-interestingwords'

"Vim Markdown
Plug 'iamcco/markdown-preview.vim'
"Markdown 添加数学公式支持
Plug 'iamcco/mathjax-support-for-mkdp'

"Bufferonly
":BufOnly 即可清除其他buffer,只保留当前buffer
Plug 'vim-scripts/BufOnly.vim'

call plug#end()
"-----------------o-------------------End-------------------o-----------------


"------------o-----------all plugins configuration-------------o---------------

"coc补全配置
" 暂时在配置里去掉了C/Cpp的配置,使用:CocConfig可以修改配置
" 功能很强大，还需要继续挖掘
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

"Neoformat C 配置
" 格式化C/C++: pacman install astyle 
let g:neoformat_enabled_c = ['astyle']
let g:neoformat_enabled_cpp = ['astyle']

"Airline配置
let g:airline#extensions#tabline#enabled = 1 		  "设置一直显示上方的tabline
let g:airline_powerline_fonts = 1   		          "这个是安装字体后 必须设置此项" 
"映射左右切换buffer
nnoremap ]b :bn<CR>
nnoremap [b :bp<CR>
"映射快速关闭当前buffer
nnoremap <leader>b :bd<CR>
"设置主题
let g:airline_theme="zenburn" 
"主题(挑选后较美观的)
" tomorrow 
" wombat
" base16 
" behelit
" bubblegum 
" dark 
" hybrid
" murmur 
" simple 
" solarized 配合solarized主题
" zenburn   配合space_vim主题 

"NerdTree
" 映射打开目录树,关闭目录树
nnoremap <leader>n :NERDTreeToggle<CR> 
" 重新读取目录更新目录树
nnoremap <leader>r :NERDTree<CR>
" 定位当前打开的文件在目录树中的位置
nnoremap <leader>v :NERDTreeFind<CR>
let g:NERDTreeWinSize=20

"TagBar configuration (need Ctags)
nnoremap <leader>t :TagbarToggle<CR>

"Cpp enhanced highlight配置
"vim 自带的语法高亮没有Cpp的部分关键字和标准库
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1

"Auto pairs 配置输入一个自动补全另一个括号或引号
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"'}

"Ctrlp 搜索文件
let g:ctrlp_map = '<C-p>'
"-----------------o-------------------End-------------------o------------------

"---------------o----------------vim配色与主题---------------o----------------
let g:solarized_termcolors=256 "设置256配色
set termguicolors              "设置真彩色
set background=dark            "背景为暗色

"colorscheme hybrid
"colorscheme gruvbox 
colorscheme space_vim_theme
"colorscheme solarized8
"colorscheme molokai
"colorscheme yowish
"-----------------o-------------------End-------------------o------------------
