FROM openjdk:8-jdk
MAINTAINER imtianx "imtianx@gmail.com"

# -----------------------set android sdk-----------------start-----

# Command line tools only from https://developer.android.com/studio/
ARG SDK_TOOLS_VERSION=4333796

ARG BUILD_TOOLS_VERSION=27.0.3

ARG PLATFORM_VERSION=27

# workspace dir
WORKDIR /workspace_android

# set android env path
ENV ANDROID_HOME /workspace_android/sdk

COPY sdk-tools-linux-4333796.zip .


# install android sdk .....start....
RUN mkdir  sdk && \
    unzip -qd sdk sdk-tools-linux-${SDK_TOOLS_VERSION}.zip && \
    rm -f sdk-tools-linux-${SDK_TOOLS_VERSION}.zip && \
    (yes | ./sdk/tools/bin/sdkmanager --no_https --update) && \
    (yes | ./sdk/tools/bin/sdkmanager --no_https "build-tools;${BUILD_TOOLS_VERSION}") && \
    (yes | ./sdk/tools/bin/sdkmanager --no_https "platform-tools") && \
    (yes | ./sdk/tools/bin/sdkmanager --no_https "platforms;android-${PLATFORM_VERSION}") && \
    (yes | ./sdk/tools/bin/sdkmanager --no_https "extras;google;m2repository") && \
    (yes | ./sdk/tools/bin/sdkmanager --no_https "extras;android;m2repository") && \
    (yes | ./sdk/tools/bin/sdkmanager --no_https "extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.2") && \
    (yes | ./sdk/tools/bin/sdkmanager --no_https "extras;m2repository;com;android;support;constraint;constraint-layout;1.0.2")

# -----------------------set android sdk-------------------end-----


# todo :add deploy ssh key

# the next build tools,clean cache ....
RUN apt-get update -y && apt-get install -y bash git openssh-client && \
    rm -rf /var/lib/apt/lists/* && \
    echo "android builder install completed!"



