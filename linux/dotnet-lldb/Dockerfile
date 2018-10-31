#https://github.com/dotnet/coreclr/blob/e432923a0cc31e1c34f94c5a2e9b75570ecf9d9a/Documentation/building/buildinglldb.md
FROM microsoft/dotnet:2.1-sdk

RUN apt-get update && apt-get install -y \
    build-essential \
    subversion \
    swig \
    python2.7-dev \
    libedit-dev \
    libncurses5-dev \
    cmake \
    git

RUN cd $HOME \
 && git clone http://llvm.org/git/llvm.git \
 && cd $HOME/llvm/tools && git clone http://llvm.org/git/clang.git \
 && git clone http://llvm.org/git/lldb.git

RUN cd $HOME/llvm \
 && git checkout release_39 \
 && cd $HOME/llvm/tools/clang \
 && git checkout release_39 \
 && cd $HOME/llvm/tools/lldb \
 && git checkout release_39

RUN mkdir -p $HOME/build/release \
 && cd $HOME/build/release \
 && cmake -DCMAKE_BUILD_TYPE=release $HOME/llvm

RUN cd $HOME/build/release/tools/lldb \
 && make -j16

ENV LLDB_INCLUDE_DIR $HOME/llvm/tools/lldb/include \
 && LLDB_LIB_DIR $HOME/build/release/lib \
 && PATH $HOME/build/release/bin:$PATH
