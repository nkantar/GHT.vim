" GHT.vim - GitHub Templates, GitHub issue and pull request template support
" Maintainer:   Nikola Kantar <http://nkantar.com>
" Version:      1.1.1


" Return a sanitized version of the current path.
function! s:GHTGetCurrentDir()
    redir => l:new_dir
    silent pwd
    redir END
    let new_dir = substitute(l:new_dir, "\n", "", "g")
    return new_dir
endfunction

" Open new scratch buffer with template file contents.
function! s:GHTOpenBufferWithTemplate(filename)
    new
    setlocal buftype=nofile
    setlocal bufhidden=hide
    setlocal noswapfile
    exec "0r " . a:filename
endfunction

" Check if current working directory is the repository root.
function! s:GHTCheckIfRepoRoot(current_dir)
    let git_config = a:current_dir . "/.git/config"
    return filereadable(l:git_config)
endfunction

" Find template, recursing up the directory tree to the repository root.
function! s:GHTFindTemplate(filename, current_dir)
    let current_file = a:current_dir . a:filename
    if s:GHTCheckIfRepoRoot(a:current_dir)
        if filereadable(l:current_file)
            call s:GHTOpenBufferWithTemplate(l:current_file)
        else
            echo "No template " . a:filename . " in this repo."
        endif
    else
        if a:current_dir != "/"
            exec "cd .."
            let new_dir = s:GHTGetCurrentDir()
            call s:GHTFindTemplate(a:filename, l:new_dir)
        else
            echo "No template " . a:filename . " in this repo."
        endif
    endif
endfunction

" This is where the magic *really* happens.
function! g:GHT(template)
    let og_dir = s:GHTGetCurrentDir()
    let base = "/.github/"
    if (a:template == "pr")
        let filename = l:base . "PULL_REQUEST_TEMPLATE.md"
    elseif (a:template == "issue")
        let filename = l:base . "ISSUE_TEMPLATE.md"
    endif
    call s:GHTFindTemplate(l:filename, l:og_dir)
    exec "cd " . l:og_dir
endfunction

command! GHTIssue call GHT('issue')
command! GHTPR call GHT('pr')
