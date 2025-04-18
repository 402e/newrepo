newrepo

newrepo is a simple Zsh script that automates the creation of a new GitHub repository from the command line.It initializes a local Git repository, makes the first commit, and pushes it to GitHub using the GitHub CLI (gh).

Features

Automatically initializes a Git repository

Creates a new GitHub repository via gh

Adds a remote and pushes the initial commit

Checks for existing commits to avoid duplicate initialization

Uses the current directory name as the repo name (or custom name if provided)

Requirements

zsh

git

gh (GitHub CLI, authenticated)

Dependency Installation

Install the required dependencies using your package manager. For example, on Arch Linux:

sudo pacman -S zsh git github-cli

Make sure the GitHub CLI is authenticated:

gh auth login

Usage

Navigate to the project directory and run:

newrepo [repository-name] [--private] [--description "Your repo description"]

If [repository-name] is not provided, the script uses the name of the current directory.

Options

--private — create a private GitHub repository

--description "description" — add a description to the repository

The script will:

Use the current folder name or given argument as the repository name

Create the repository on GitHub

Initialize a Git repository if one doesn't exist

Make the initial commit if there are no commits yet

Push the code to the new GitHub repository

License

MIT — see LICENSE for details.

