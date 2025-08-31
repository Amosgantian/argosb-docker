FROM debian:stable-slim

ENV DEBIAN_FRONTEND=noninteractive

# 安装必要工具
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash curl wget ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# 容器启动时执行 argosb 脚本
ENTRYPOINT ["/bin/bash", "-c", "vmpt='7860' argo="y" agn="amsgs-amsrxp.hf.space" agk="eyJhIjoiZTZhZTliNTBjZDNkZjJkZGEyY2FhZjg2N2FlMWQ1ZWYiLCJ0IjoiMDc3ODMxMWYtOTY5NS00MTViLWE1ZDYtMDdiYzQ5ZTVjNzFmIiwicyI6IlpXWmpZemhtT0dFdFptVmhZUzAwWlRNNUxXemlNall0Tldaa01qSmpNamhrTW1JeSJ9" bash <(curl -Ls https://raw.githubusercontent.com/yonggekkk/argosb/main/argosb.sh)"]
