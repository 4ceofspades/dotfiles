syntax on
set hlsearch
set autoindent
set tabstop=2
set shiftwidth=2
" https://federico-lox.github.io/development/tabs-stop-the-truth-about-vim-tab-spaces.html
"set softtabstop=2

" use spaces instead of tabs
set expandtab
set smartindent
set number

" filetype plugin must be on for vim-go to work
filetype plugin on

" set explicit background color for tmux not to mess up the color scheme
set background=dark

" enable scrolling
set mouse=a

" auto close brackets
"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O

" do not use recommended settings for python
let g:python_recommended_style = 0

" commenting blocks of code with ,cc and ,cu
augroup commenting_blocks_of_code
  autocmd!
  autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
  autocmd FileType sh,ruby,python   let b:comment_leader = '# '
  autocmd FileType conf,fstab       let b:comment_leader = '# '
  autocmd FileType tex              let b:comment_leader = '% '
  autocmd FileType mail             let b:comment_leader = '> '
  autocmd FileType vim              let b:comment_leader = '" '
augroup END
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR> comment with cmd+/
