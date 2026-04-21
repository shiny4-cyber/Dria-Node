FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    curl \
    bash \
    ca-certificates \
    libgomp1

# Install dria-node
RUN curl -fsSL https://raw.githubusercontent.com/firstbatchxyz/dkn-compute-node/master/install.sh | sh

ENV PATH="/usr/local/bin:$PATH"

CMD ["sh", "-c", "dria-node start --wallet $DRIA_WALLET --model $DRIA_MODELS --skip-update & sleep infinity"]
