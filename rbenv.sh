#!/bin/env bash

main() {
    local rbenv=$HOME/.rbenv
    local bashrc=$HOME/.bashrc
    echo "Installing rbenv ..."
    git clone https://github.com/rbenv/rbenv.git $rbenv
    cd $rbenv && src/configure && make -C src
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $bashrc
    $rbenv/bin/rbenv init
    echo 'eval "$(rbenv init - bash)"' >> $bashrc
    source $bashrc
    mkdir -p "$(rbenv root)"/plugins
    git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
    echo ""
    echo "Done"
}

main
