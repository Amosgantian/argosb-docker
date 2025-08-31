FROM debian:stable-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV HOME=/app

# 安装必要工具
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash curl wget ca-certificates iproute2 procps \
    && rm -rf /var/lib/apt/lists/*

# Hugging Face 默认可写目录
WORKDIR /app

# 拷贝脚本到容器中
COPY argosb.sh /app/argosb.sh

RUN export DEBIAN_FRONTEND=noninteractive; \
    apt-get update; \
    apt-get install -y tzdata openssh-server curl ca-certificates wget vim net-tools supervisor unzip iputils-ping telnet git iproute2 --no-install-recommends; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*; \
    chmod +x /app/argosb.sh
    chmod -R 777 /app; \
    useradd -u 1000 -g 0 -m -s /bin/bash user


# 设置默认环境变量（可在 docker run -e 覆盖）
ENV vmpt="7860" \
    argo="y" \
    agn="argosbhugging.yahaibio.qzz.io" \
    agk="eyJhIjoiZTZhZTliNTBjZDNkZjJkZGEyY2FhZjg2N2FlMWQ1ZWYiLCJ0IjoiNjI4MWQ5MjEtMjZmZi00M2JhLWExODMtNTU3OTA1Yzk3NTNiIiwicyI6Ik1qZzRZVGxsWW1NdFl6WTFOQzAwTXpVMUxXSXlOelF0Tm1SbE0yVXlNRE14WkRVMyJ9"

EXPOSE 7860

# 运行 ArgoSB 脚本
ENTRYPOINT ["/bin/bash", "/app/argosb.sh"]
