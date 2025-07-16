#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash git 

#command 1: sudo nixos-rebuild switch --flake .#desktop
#command 2: home-manager switch --flake .#vlad@desktop
git add *&>/dev/null
# Display help message
show_help() {
  echo "Usage: $(basename "$0") [options]"
  echo "rebuilds system based on modifications made to files in nixos and home-manager dir respectivly"
  echo "not rebuilding nix/homemanager unless files are updated"
  echo
  echo "Options:"
  echo "  -f       Force run both commands irrespective of changes"
  echo "  -h, --help  Show this help message and exit"
  exit 0
}

# Check for help flag
for arg in "$@"; do
  case $arg in
    -h|--help)
      show_help
      ;;
  esac
done

force_run=false
run_cmd1=false
run_cmd2=false

while getopts 'f' flag; do
  case "${flag}" in
    f) force_run=true ;;
    *) ;;
  esac
done

# Check for changes in ./nixos directory
if [ -n "$(git status ./nixos --porcelain)" ]; then
  run_cmd1=true
fi

# Check for changes in home-manager directory
if [ -n "$(git status ./home-manager --porcelain)" ]; then
  run_cmd2=true
fi

# Check for changes in device-specific directory
if [ -n "$(git status ./device-specific --porcelain)" ]; then
  run_cmd1=true
  run_cmd2=true
fi

# If -f is passed, run both commands irrespective of changes
if [ "$force_run" = true ]; then
  echo "detected force run, running both rebuilds"
  run_cmd1=true
  run_cmd2=true
fi

# Execute the commands based on the conditions
if [ "$run_cmd1" = true ]; then
  echo "rebuilding nix"
  echo "$(git status ./nixos --porcelain)"
  sudo nixos-rebuild switch --flake .
fi

if [ "$run_cmd2" = true ]; then
  echo "rebuilding home manager"
  echo "$(git status ./home-manager --porcelain)"
  home-manager switch --flake .
fi
if [ "$run_cmd1" = true ] || [ "$run_cmd2" = true ]; then
  nix_generation=$(nixos-rebuild list-generations | grep current)

  git commit -am "Nix generation: $nix_generation"
  git push
fi