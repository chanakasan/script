#!/bin/env bash

remove_from_bashrc() {
  sed -i '/#__rbenv_start/,/#__rbenv_end/{d}' $bashrc
}

copy_to_bashrc() {
  echo '#__rbenv_start' >> $bashrc
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $bashrc
  echo 'eval "$(rbenv init - bash)"' >> $bashrc
  echo '#__rbenv_end' >> $bashrc
}

check_dir_exists() {
  if [ -d "$rbenv" ]; then
    echo "$rbenv directory already exists"
    echo "Please remove and try again"
    exit 1
  fi
}

main() {
    local rbenv=$HOME/.rbenv
    local bashrc=$HOME/.bashrc

    echo "=> Installing rbenv ..."
    check_dir_exists
    git clone https://github.com/rbenv/rbenv.git $rbenv
    cd $rbenv && src/configure && make -C src
    $rbenv/bin/rbenv init
    . $bashrc
    remove_from_bashrc
    copy_to_bashrc
    echo "=> Installing ruby-build ..."
    mkdir -p $rbenv/plugins
    git clone https://github.com/rbenv/ruby-build.git $rbenv/plugins/ruby-build
    echo ""
    echo "=> Done"
}

main
