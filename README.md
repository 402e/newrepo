# newrepo

**newrepo** is a simple Zsh script that automates the creation of a new GitHub repository from the command line.
It initializes a local Git repository, creates the first commit, and pushes it to GitHub using the [GitHub CLI (`gh`)](https://cli.github.com/).

---

## Features

- Initializes a Git repository if not present
- Creates a GitHub repository via `gh`
- Pushes the initial commit
- Checks for existing commits to avoid duplicates
- Uses the current folder name or a provided name for the repo

---

## Requirements

- [`zsh`](https://www.zsh.org/)
- [`git`](https://git-scm.com/)
- [`gh`](https://cli.github.com/) (GitHub CLI, authenticated)

---

## Dependency Installation

For Arch Linux:

```bash
sudo pacman -S zsh git github-cli
```

Then authenticate gh:

```bash
gh auth login
```

## Usage

```bash
newrepo [repository-name] [--option value]
```

If no repository name is provided, the current directory name is used.

### Option

| Option           | Description                         |
|------------------|-------------------------------------|
| --private        | Create a private GitHub repository  |
| --description "" | Add a description to the repository |

Example
`newrepo my-project --private --description "My personal tool"`

## License

This project is licensed under the MIT License.