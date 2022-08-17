ARG AZURE_CLI_VERSION="2.39.0"
FROM mcr.microsoft.com/azure-cli:${AZURE_CLI_VERSION}
ARG GH_CLI_VERSION="2.14.4"

# Install Dependancies 
RUN apk add zsh figlet vim

# # Set zsh as default shell
# # `/etc/profile` logic did't like it when zsh was default.
# RUN sed -i -e "s/bin\/ash/bin\/zsh/" /etc/passwd

RUN echo -e "\nfiglet 'AZ Dev CLI'\necho 'https://github.com/venura9/azd'" >> ~/.bashrc && \
    echo -e "\nfiglet 'AZ Dev CLI'\necho 'https://github.com/venura9/azd'" >> ~/.zshrc

# Install GitHub CLI
RUN curl -O -L https://github.com/cli/cli/releases/download/v${GH_CLI_VERSION}/gh_${GH_CLI_VERSION}_linux_amd64.tar.gz &&  \
    tar -zxvf gh_${GH_CLI_VERSION}_linux_amd64.tar.gz && \
    chmod +x gh_${GH_CLI_VERSION}_linux_amd64/bin/gh && \
    mv gh_${GH_CLI_VERSION}_linux_amd64/bin/* /usr/bin && \
    mv gh_${GH_CLI_VERSION}_linux_amd64/share/* /usr/share/ && \
    rm -rf gh_${GH_CLI_VERSION}_linux_amd64*

# Install azd    
RUN sh -c "$(curl -fsSL https://aka.ms/install-azd.sh)"

# Install zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"