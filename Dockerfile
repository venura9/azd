ARG AZURE_CLI_VERSION="2.39.0"
FROM mcr.microsoft.com/azure-cli:${AZURE_CLI_VERSION}
ARG GH_CLI_VERSION="2.14.4"

# Install Dependancies 
RUN apk add zsh figlet vim

# Install GitHub CLI
RUN curl -O -L https://github.com/cli/cli/releases/download/v${GH_CLI_VERSION}/gh_${GH_CLI_VERSION}_linux_amd64.tar.gz &&  \
    tar -zxvf gh_${GH_CLI_VERSION}_linux_amd64.tar.gz && \
    chmod +x gh_${GH_CLI_VERSION}_linux_amd64/bin/gh && \
    mv gh_${GH_CLI_VERSION}_linux_amd64/bin/* /usr/bin && \
    mv gh_${GH_CLI_VERSION}_linux_amd64/share/* /usr/share/ && \
    rm -rf gh_${GH_CLI_VERSION}_linux_amd64*

# Install azd
ARG AZD_VERSION="0.1.0-beta.5"    
RUN curl -O -L https://github.com/Azure/azure-dev/releases/download/azure-dev-cli_${AZD_VERSION}/azd-linux-amd64.tar.gz && \
    tar -xvzf azd-linux-amd64.tar.gz && \
    chmod +x azd-linux-amd64 && \
    mv azd-linux-amd64 /usr/bin/azd && \
    rm -rf azd-linux-amd64*
# RUN sh -c "$(curl -fsSL https://aka.ms/install-azd.sh)"

# Install ohmyzsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# # Set zsh as default shell
# # `/etc/profile` logic did't like it when zsh was default.
# RUN sed -i -e "s/bin\/ash/bin\/zsh/" /etc/passwd

RUN echo -e "\nfiglet 'AZ Dev CLI'\necho 'https://github.com/venura9/azd'\n" >> ~/.bashrc && \
    echo -e "\nfiglet 'AZ Dev CLI'\necho 'https://github.com/venura9/azd'\n" >> ~/.zshrc