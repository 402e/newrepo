#!/bin/zsh

# Default values
name=""
visibility="--public"
description=""

# Parse arguments
while [[ $# -gt 0 ]]; do
  case "$1" in
    --private)
      visibility="--private"
      shift
      ;;
    --description)
      description="$2"
      shift 2
      ;;
    *)
      name="$1"
      shift
      ;;
  esac
done

# Use current directory name if no name is provided
if [[ -z "$name" ]]; then
  name="${PWD##*/}"
  echo "No repository name provided. Using current folder name: $name"
fi

# Get GitHub username
user=$(gh api user --jq .login 2>/dev/null)

# Check if the repository already exists on GitHub
if gh repo view "$user/$name" &>/dev/null; then
  echo "Repository '$user/$name' already exists on GitHub."
  exit 1
fi

# Initialize Git repository if needed
if [[ ! -d .git ]]; then
  git init
fi

# Create initial commit if there are no commits yet
if ! git rev-parse --verify HEAD >/dev/null 2>&1; then
  echo "Creating initial commit..."
  git add .
  git commit -m "Initial commit"
else
  echo "Git already contains commits."
fi

# Create GitHub repository and push
echo "Creating $visibility repository '$name' on GitHub..."
gh repo create "$name" $visibility --description "$description" --source=. --remote=origin --push
