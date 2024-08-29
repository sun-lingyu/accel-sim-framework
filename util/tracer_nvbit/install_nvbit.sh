export BASH_ROOT="$( cd "$( dirname "$BASH_SOURCE" )" && pwd )"
rm -rf $BASH_ROOT/nvbit_release
arch=$(uname -m)
if [ $arch == "x86_64" ]
then
    wget https://github.com/NVlabs/NVBit/releases/download/1.7/nvbit-Linux-x86_64-1.7-1.tar.bz2
    tar -xf nvbit-Linux-x86_64-1.7-1.tar.bz2 -C $BASH_ROOT
    rm nvbit-Linux-x86_64-1.7-1.tar.bz2
elif [ $arch == "aarch64" ]
then
    wget https://github.com/NVlabs/NVBit/releases/download/1.7/nvbit-Linux-aarch64-1.7.tar.bz2
    tar -xf nvbit-Linux-aarch64-1.7.tar.bz2 -C $BASH_ROOT
    rm nvbit-Linux-aarch64-1.7.tar.bz2
else
    echo "$arch not supported"
fi