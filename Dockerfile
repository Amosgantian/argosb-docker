FROM debian:stable-slim

ENV DEBIAN_FRONTEND=noninteractive

# 安装必要工具
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash curl wget ca-certificates iproute2 procps \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /argosb

# 拷贝脚本到容器中
COPY argosb.sh /argosb/argosb.sh
RUN chmod +x /argosb/argosb.sh

# 设置默认环境变量（可在 docker run -e 覆盖）
ENV vmpt="7860" \
    argo="y" \
    agn="amsgs-amsrxp.hf.space" \
    agk="eyJhIjoiZTZhZTliNTBjZDNkZjJkZGEyY2FhZjg2N2FlMWQ1ZWYiLCJ0IjoiMDc3ODMxMWYtOTY5NS00MTViLWE1ZDYtMDdiYzQ5ZTVjNzFmIiwicyI6IlpXWmpZemhtT0dFdFptVmhZUzAwWlRNNUxXemlNall0Tldaa01qSmpNamhrTW1JeSJ9"

# 容器启动时执行脚本（注意这里改了！）
ENTRYPOINT /bin/bash /argosb/argosb.sh
