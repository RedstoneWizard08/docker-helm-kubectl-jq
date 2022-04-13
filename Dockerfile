FROM ubuntu:focal

# Metadata
LABEL org.label-schema.name="docker-helm-kubectl-jq" \
    org.label-schema.url="https://ghcr.io/redstonewizard08/docker-helm-kubectl-jq" \
    org.label-schema.vcs-url="https://github.com/redstonewizard08/docker-helm-kubectl-jq"

# Note: Latest version of kubectl may be found at:
# https://github.com/kubernetes/kubernetes/releases
ENV KUBE_LATEST_VERSION="v1.19.2"
# Note: Latest version of helm may be found at:
# https://github.com/kubernetes/helm/releases
ENV HELM_VERSION="v3.3.4"

RUN apt update && apt-get -y install ca-certificates bash git jq \
    && wget -q https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/$(dpkg --print-architecture)/kubectl -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && wget -q https://get.helm.sh/helm-${HELM_VERSION}-linux-$(dpkg --print-architecture).tar.gz -O - | tar -xzO linux-$(dpkg --print-architecture)/helm > /usr/local/bin/helm \
    && chmod +x /usr/local/bin/helm

WORKDIR /config

CMD bash
