# build for both arm/x86 with:
#   docker buildx build --platform linux/amd64,linux/arm/v7 -t uiautomator -f uiautomator.dockerfile --push .

FROM petemyron/adb

RUN apk -U --no-cache add \
    python \
    python3 \
    py-pip \
    py3-setuptools \
    python-dev \
    zlib \
    libxml2 \
    libxml2-dev \
    libxslt-dev \
    jpeg-dev \
    zlib-dev \
    python3-dev \
    gcc \
    build-base \
    linux-headers

RUN python --version && \
    python3 --version && \
    pip install uiautomator uiautomator2 influxdb boto3 && \
    pip3 install uiautomator uiautomator2 influxdb boto3

CMD ["adb", "devices"]
