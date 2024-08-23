export BASH_ROOT="$( cd "$( dirname "$BASH_SOURCE" )" && pwd )"

rm -rf $BASH_ROOT/nvbit_release
wget https://github.com/NVlabs/NVBit/releases/download/1.7/nvbit-Linux-aarch64-1.7.tar.bz2
tar -xf nvbit-Linux-aarch64-1.7.tar.bz2 -C $BASH_ROOT
rm nvbit-Linux-aarch64-1.7.tar.bz2

