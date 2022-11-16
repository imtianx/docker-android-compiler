FROM openjdk:8-jdk
MAINTAINER imtianx "imtianx@gmail.com"

# -----------------------set android sdk-----------------start-----

# Command line tools only from https://developer.android.com/studio/
ARG SDK_TOOLS_VERSION=9123335

ARG COMPILE_SDK_VERSION=30

ARG BUILD_TOOLS_VERSION=30.0.3

# workspace dir
WORKDIR /workspace_android

# set android env path
ENV ANDROID_HOME /workspace_android/sdk

# install android sdk .....start....
RUN mkdir  sdk && \
    wget http://dl.google.com/android/repository/sdk-tools-linux-${SDK_TOOLS_VERSION}.zip && \
    unzip -qd sdk sdk-tools-linux-${SDK_TOOLS_VERSION}.zip && \
    rm -f sdk-tools-linux-${SDK_TOOLS_VERSION}.zip && \
    (yes | ./sdk/tools/bin/sdkmanager --no_https --update) && \
    (yes | ./sdk/tools/bin/sdkmanager --no_https "build-tools;${BUILD_TOOLS_VERSION}") && \
    (yes | ./sdk/tools/bin/sdkmanager --no_https "platform-tools") && \
    (yes | ./sdk/tools/bin/sdkmanager --no_https "platforms;android-${COMPILE_SDK_VERSION}") && \
    (yes | ./sdk/tools/bin/sdkmanager --no_https "extras;google;m2repository") && \
    (yes | ./sdk/tools/bin/sdkmanager --no_https "extras;android;m2repository")

# -----------------------set android sdk-------------------end-----


# todo :add deploy ssh key

# the next build tools,clean cache ....
RUN apt-get update -y && apt-get install -y bash git openssh-client && \
    rm -rf /var/lib/apt/lists/* && \
    echo "android builder install completed!"


# ref:https://blog.microdog.me/2017/05/10/Build-Android-Project-with-Gitlab-CI/

