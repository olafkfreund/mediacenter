FROM debian:latest

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ENV AZURE_CLI_VERSION "0.10.13"
ENV NODEJS_APT_ROOT "node_6.x"
ENV NODEJS_VERSION "6.10.0"
ENV TERRAFORM_VERSION "0.12.16"

ENV DEBIAN_FRONTEND=noninteractive
ARG USERNAME=vscode
ARG USER_UID=2000
ARG USER_GID=$USER_UID

RUN apt-get update -qq && \
    apt-get upgrade -qqy && \
    apt-get install -qqy --no-install-recommends\
      apt-transport-https \
      openssl \
      ssh \
      wget \
      unzip \
      gnupg \
      apt-utils \
      build-essential \
      bash-completion \
      curl \
      ca-certificates \
      git \
      lsb-release \
      python-all \
      rlwrap \
      vim \
      nano \
      jq && \
    rm -rf /var/lib/apt/lists/* && \
    curl https://deb.nodesource.com/${NODEJS_APT_ROOT}/pool/main/n/nodejs/nodejs_${NODEJS_VERSION}-1nodesource1~jessie1_amd64.deb > node.deb && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin && \
    wget https://get.helm.sh/helm-v3.1.2-linux-amd64.tar.gz && \
    tar -zxvf helm-v3.1.2-linux-amd64.tar.gz && \
    mv linux-amd64/helm  /usr/local/bin/helm && \
    rm -rf linux-amd64 && \
    rm -rf helm-v3.1.2-linux-amd64.tar.gz && \
    rm  terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
      dpkg -i node.deb && \
      rm node.deb && \
    curl -sL https://packages.microsoft.com/keys/microsoft.asc | \
    gpg --dearmor | tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null && \
    AZ_REPO=$(lsb_release -cs) && \
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | tee /etc/apt/sources.list.d/azure-cli.list && \
    apt-get update -qqy && \
    apt-get install azure-cli
RUN az aks install-cli
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl
RUN apt-get install kubectx
RUN curl -Lo kubebox https://github.com/astefanutti/kubebox/releases/download/v0.7.0/kubebox-linux
RUN mv kubebox /usr/local/bin/kubebox
RUN chmod +x /usr/local/bin/kubebox
RUN kubectl completion bash >/etc/bash_completion.d/kubectl
RUN echo "deb http://deb.debian.org/debian/ testing main contrib non-free" >> /etc/apt/sources.list && \
    apt-get update && apt-get upgrade -y && \
    apt-get install -y kubectx && \
    apt-get install -y direnv \
  # Create a non-root user to use if preferred - see https://aka.ms/vscode-remote/containers/non-root-user.
    && groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    # [Optional] Add sudo support for the non-root user
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME\
    && chmod 0440 /etc/sudoers.d/$USERNAME

ENV EDITOR=vim
ENV DEBIAN_FRONTEND=dialog
USER vscode
