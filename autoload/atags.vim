if exists('g:autoload_atags')
  finish
endif

let g:autoloaded_atags = 1

" Section: Generation callbacks

let g:atags_had_errors=0

function! atags#onGenerateErr(id, data)
  let g:atags_had_errors=1
  let msg = "❗ An error occurred generating ctags: " . join(a:data)
  echom msg
endfunction

function! atags#onGenerateOut()
  if g:atags_had_errors==0 && g:atags_quiet==0
    echom "🎉 tags generated  🎉"
  endif
endfunction

function! atags#onGenerateExit()

endfunction

" Section: Commands
function! atags#setup()
  if !exists('g:atags_on_generate_stderr')
    let g:atags_on_generate_stderr = 'atags#onGenerateErr'
  endif

  if !exists('g:atags_on_generate_stdout')
    let g:atags_on_generate_stdout = 'atags#onGenerateOut'
  endif

  if !exists('g:atags_on_generate_exit')
    let g:atags_on_generate_exit = 'atags#onGenerateExit'
  endif

  if !exists('g:atags_quiet')
    let g:atags_quiet = 0
  endif

  if !exists('g:atags_build_commands_list')
    let g:atags_build_commands_list = [
          \"ctags -R -f tags.tmp",
          \"awk 'length($0) < 400' tags.tmp > tags",
          \"rm tags.tmp"
          \]
  endif

endfunction

function! atags#generate()
  let opts = {
        \ 'on_stderr': function(g:atags_on_generate_stderr),
        \ 'on_stdout': function(g:atags_on_generate_stdout),
        \ 'on_exit': function(g:atags_on_generate_exit)
        \ }
  let g:atags_had_errors=0
  call extend(g:atags_build_commands_list, ["echo 'ok'"])
  call jobstart(join(g:atags_build_commands_list, ";"), opts)
endfunction

" vim:set et sw=2 foldmethod=expr foldexpr=getline(v\:lnum)=~'^\"\ Section\:'?'>1'\:getline(v\:lnum)=~#'^fu'?'a1'\:getline(v\:lnum)=~#'^endf'?'s1'\:'=':
