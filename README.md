# GHT.vim

GitHub Templates &mdash; GitHub issue and pull request template support

## What + Why

**GHT** allows for quick editing of issue and pull request text based on the [templates GitHub supports](https://github.com/blog/2111-issue-and-pull-request-templates 'Issue and Pull Request templates').

I like writing in Vim *so much* that I found myself copy/pasting the template text from the new issue and pull request pages at first, and then from the files in the repository afterwards, only to have to copy/paste it all back into GitHub before dealing with labels, milestones, and assignees. This plugin makes that process far less annoying, by only requiring the second copy/paste. :scissors::page_facing_up::scream:

Also, one ought to know how to customize one's editor of choice, and now I know some basic vimscript. :thumbsup:

## Installation

### Vundle

`Plugin 'nkantar/GHT.vim'`

## Usage

- `GHTIssue`
- `GHTPR`

Each of these commands looks for the appropriate template (`/.github/ISSUE_TEMPLATE.md` and `/.github/PULL_REQUEST_TEMPLATE.md`) in the repository's root. If no file is found, an error message is shown. If it *is* found, a new scratch buffer is opened with the contents of the file.

If you prefer to key mappings to commands, you probably want to add something like this to your `.vimrc`:

```viml
nmap <silent> ;i :call GHT('issue')<CR>
nmap <silent> ;p :call GHT('pr')<CR>
```

## Contributing

Feel free to [create issues](https://github.com/nkantar/GHT.vim/issues/new 'New Issue') and submit pull requests. No, there are no templates at this moment... :smirk:

You can also [get in touch](mailto:nik@nkantar.com 'Email me'). :love_letter:
