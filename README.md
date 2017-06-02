# GHT.vim

GitHub Templates &mdash; GitHub issue and pull request template support

![ght](https://cloud.githubusercontent.com/assets/568543/17439488/32d15126-5add-11e6-9aea-4042b802e56d.gif)

## What + Why

**GHT** allows for quick editing of issue and pull request text based on the [templates GitHub supports](https://github.com/blog/2111-issue-and-pull-request-templates 'Issue and Pull Request templates').

I like writing in Vim *so much* that I found myself copy/pasting the template text from the new issue and pull request pages at first, and then from the files in the repository afterwards, only to have to copy/paste it all back into GitHub before dealing with labels, milestones, and assignees. This plugin makes that process far less annoying, by only requiring the second copy/paste. :scissors::page_facing_up::scream:

Also, one ought to know how to customize one's editor of choice, and now I know some basic vimscript. :thumbsup:

[![Say Thanks!](https://img.shields.io/badge/Say%20Thanks-!-1EAEDB.svg)](https://saythanks.io/to/nkantar)

## Installation

### Vundle

```viml
Plugin 'nkantar/GHT.vim'
```

## Usage

```viml
:GHTIssue
:GHTPR
```

Each of these commands looks for the appropriate template (`/.github/ISSUE_TEMPLATE.md` and `/.github/PULL_REQUEST_TEMPLATE.md`) in the repository's root. If no file is found, an error message is shown. If it *is* found, a new scratch buffer is opened with the contents of the file.

If you prefer to key mappings to commands, you probably want to add something like this to your `.vimrc`:

```viml
nmap <silent> ;i :call GHT('issue')<CR>
nmap <silent> ;p :call GHT('pr')<CR>
```

## Help

- IRC: [irc://chat.freenode.net:6667/ght-vim](https://webchat.freenode.net/?channels=%23ght-vim&uio=MTE9NzIaa '#ght-vim on freenode')

## Contributing

Feel free to [create](https://github.com/nkantar/GHT.vim/issues/new 'New Issue') and [tackle](https://github.com/nkantar/GHT.vim/issues?q=is%3Aissue+is%3Aopen+label%3A%22help+wanted%22 'Help Wanted') issues. No, there are no templates at this moment... :smirk:

You can also get in touch via [email :love_letter:](mailto:nik@nkantar.com 'Email me') or [Twitter :bird:](https://twitter.com/nkantar '@nkantar').
