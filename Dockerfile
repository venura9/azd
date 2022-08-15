ARG AZURE_CLI_VERSION="2.39.0"
FROM mcr.microsoft.com/azure-cli:${AZURE_CLI_VERSION}
ARG GH_VERSION="2.14.4"

# Install GitHub CLI
RUN curl -O -L https://github.com/cli/cli/releases/download/v${GH_VERSION}/gh_${GH_VERSION}_linux_amd64.tar.gz &&  \
    tar -zxvf gh_${GH_VERSION}_linux_amd64.tar.gz && \
    chmod +x gh_${GH_VERSION}_linux_amd64/bin/gh && \
    mv gh_${GH_VERSION}_linux_amd64/bin/* /usr/bin && \
    mv gh_${GH_VERSION}_linux_amd64/share/* /usr/share/ && \
    rm -rf gh_${GH_VERSION}_linux_amd64* && \

# Install azd    
RUN curl -fsSL https://aka.ms/install-azd.sh | bash

# Install zsh
RUN apk add zsh && \
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
