FROM nextstrain/base

# Use these variables for platform-specific instructions.
ARG TARGETPLATFORM
ARG TARGETOS
ARG TARGETARCH

# Example 1: Add nano using APT, since nextstrain/base based on Debian.
RUN curl -fsSL https://install.julialang.org |  sh -s -- -y

ENV PATH="${PATH}:/nextstrain/.juliaup/bin"

RUN juliaup add 1.7.3

RUN juliaup default 1.7.3

RUN apt-get update

RUN apt-get install -y gcc

RUN julia -e 'using Pkg; Pkg.add("TreeKnit")'

RUN julia -e 'using Pkg; Pkg.add("ArgParse")'
