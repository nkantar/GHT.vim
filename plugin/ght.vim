" GHT.vim - GitHub Templates
" GitHub issue and pull request template support
" Maintainer:   Nikola Kantar <http://nkantar.com>
" Version:      1.1.4


" Return a sanitized version of current path.
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
    setlocal syntax=markdown
    exec "0r" a:filename
endfunction

" Check if current working directory is repository root.
function! s:GHTCheckIfRepoRoot(current_dir)
    let git_config = a:current_dir . "/.git/config"
    return filereadable(l:git_config)
endfunction

" Output error message when template isn't found.
function! s:GHTTemplateNotFound(filename)
    echo "Can't find template" a:filename
endfunction

" Find template, recursing up tree to repository or filesystem root.
function! s:GHTFindTemplate(filename, current_dir)
    let current_file = a:current_dir . a:filename
    if s:GHTCheckIfRepoRoot(a:current_dir)
        if filereadable(l:current_file)
            call s:GHTOpenBufferWithTemplate(l:current_file)
        else
            call s:GHTTemplateNotFound(a:filename)
        endif
    else
        if a:current_dir != "/"
            exec "cd .."
            let new_dir = s:GHTGetCurrentDir()
            call s:GHTFindTemplate(a:filename, l:new_dir)
        else
            call s:GHTTemplateNotFound(a:filename)
        endif
    endif
endfunction

" This is where the magic *really* happens.
function! g:GHT(template)
    let og_dir = s:GHTGetCurrentDir()
    let base = "/.github/"
    if (a:template == "issue")
        let filename = l:base . "ISSUE_TEMPLATE.md"
    elseif (a:template == "pr")
        let filename = l:base . "PULL_REQUEST_TEMPLATE.md"
    else
        echo "Not sure what you're looking for"
    endif
    if exists("l:filename")
        call s:GHTFindTemplate(l:filename, l:og_dir)
        exec "cd" l:og_dir
    endif
endfunction

command! GHTIssue call GHT('issue')
command! GHTPR call GHT('pr')

