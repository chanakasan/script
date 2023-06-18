main() {
  local rbenv=$HOME/.rbenv
  local temp=$HOME/temp
  mkdir -p $temp
  cd $temp
  wget https://rvm.io/binaries/ubuntu/20.04/x86_64/ruby-3.1.3.tar.bz2
  tar -xvf ruby-3.1.3.tar.bz2
  mv ruby-3.1.3 $rbenv/versions/3.1.3
  rbenv global 3.1.3
}

main
