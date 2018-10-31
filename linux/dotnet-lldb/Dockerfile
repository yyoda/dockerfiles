#https://github.com/dotnet/coreclr/blob/v2.1.5/Documentation/building/linux-instructions.md
FROM microsoft/dotnet:2.1-sdk

RUN apt-get update && apt-get install -y \
    cmake llvm-3.9 \
    clang-3.9 \
    lldb-3.9 \
    liblldb-3.9-dev \
    libunwind8 \
    libunwind8-dev \
    gettext \
    libicu-dev \
    liblttng-ust-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    uuid-dev \
    libnuma-dev \
    libkrb5-dev
