let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/networkshared/work/nearform/bench/fast-json-stringify
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
$argadd ~/networkshared/work/nearform/bench/fast-json-stringify
edit bench2.js
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 142 + 142) / 285)
exe 'vert 2resize ' . ((&columns * 142 + 142) / 285)
argglobal
balt s.js
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=50
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 10 - ((9 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 10
normal! 022|
lcd ~/networkshared/work/nearform/bench/fast-json-stringify
wincmd w
argglobal
if bufexists("~/networkshared/work/nearform/bench/fast-json-stringify/s.js") | buffer ~/networkshared/work/nearform/bench/fast-json-stringify/s.js | else | edit ~/networkshared/work/nearform/bench/fast-json-stringify/s.js | endif
if &buftype ==# 'terminal'
  silent file ~/networkshared/work/nearform/bench/fast-json-stringify/s.js
endif
balt ~/networkshared/work/nearform/bench/fast-json-stringify/bench2.js
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=50
setlocal fml=1
setlocal fdn=20
setlocal fen
158
normal! zo
192
normal! zo
199
normal! zo
214
normal! zo
255
normal! zo
299
normal! zo
308
normal! zo
let s:l = 310 - ((20 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 310
normal! 0
lcd ~/networkshared/work/nearform/bench/fast-json-stringify
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 142 + 142) / 285)
exe 'vert 2resize ' . ((&columns * 142 + 142) / 285)
tabnext 1
badd +1 ~/networkshared/work/nearform/bench/fast-json-stringify
badd +306 ~/networkshared/work/nearform/bench/fast-json-stringify/s.js
badd +3 ~/networkshared/work/nearform/bench/fast-json-stringify/bench2.js
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOF
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
