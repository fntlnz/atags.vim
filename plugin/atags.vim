if exists('g:loaded_atags')
  finish
endif
let g:loaded_atags = 1

augroup atags
  autocmd!
  autocmd WinEnter,VimEnter * call atags#setup()
augroup END

" vim:set et sw=2 foldmethod=expr foldexpr=getline(v\:lnum)=~'^\"\ Section\:'?'>1'\:getline(v\:lnum)=~#'^fu'?'a1'\:getline(v\:lnum)=~#'^endf'?'s1'\:'=':
