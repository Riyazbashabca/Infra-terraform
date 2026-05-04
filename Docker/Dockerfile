FROM jenkins/jenkins:lts

USER root

ARG TERRAFORM_VERSION=1.6.6
ARG KUBECTL_VERSION=v1.29.4
ARG HELM_VERSION=v3.14.4

# Install base tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    gnupg \
    lsb-release \
    unzip \
    wget \
    apt-transport-https \
    && rm -rf /var/lib/apt/lists/*

# ----------------------------
# Install Terraform
# ----------------------------
RUN wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && mv terraform /usr/local/bin/terraform \
    && chmod +x /usr/local/bin/terraform \
    && rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# ----------------------------
# Install kubectl
# ----------------------------
RUN curl -fsSLo /usr/local/bin/kubectl https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
    && chmod +x /usr/local/bin/kubectl

# ----------------------------
# Install Helm
# ----------------------------
RUN wget -q https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz \
    && tar -zxvf helm-${HELM_VERSION}-linux-amd64.tar.gz \
    && mv linux-amd64/helm /usr/local/bin/helm \
    && chmod +x /usr/local/bin/helm \
    && rm -rf linux-amd64 helm-${HELM_VERSION}-linux-amd64.tar.gz

# ----------------------------
# Install Azure CLI
# ----------------------------
# ----------------------------
# Install Azure CLI (FIXED)
# ----------------------------
RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.gpg \
    && echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ bookworm main" > /etc/apt/sources.list.d/azure-cli.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends azure-cli \
    && rm -rf /var/lib/apt/lists/*

USER jenkins