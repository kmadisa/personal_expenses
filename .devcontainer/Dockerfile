FROM ubuntu:20.04

# Install fish shell
RUN apt-get update && apt-get install -y software-properties-common
RUN apt-add-repository ppa:fish-shell/release-3
RUN apt-get update && apt-get install -y fish

# Prerequisites
RUN apt update && apt install -y curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget

# Setup new user
RUN useradd -ms /bin/bash developer
USER developer
WORKDIR /home/developer

# Prepare Android directories and system variables
RUN mkdir -p Android/Sdk
ENV ANDROID_SDK_ROOT /home/developer/Android/Sdk
RUN mkdir -p .android && touch .android/repositories.cfg

# Setup Android SDK
RUN wget -O sdk-tools.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
RUN unzip sdk-tools.zip && rm sdk-tools.zip
RUN mv tools Android/Sdk/tools
RUN cd Android/Sdk/tools/bin && yes | ./sdkmanager --licenses
RUN cd Android/Sdk/tools/bin && ./sdkmanager "build-tools;29.0.2" "patcher;v4" "platform-tools" "platforms;android-29" "sources;android-29"

# Download Flutter SDK
#RUN git clone https://github.com/flutter/flutter.git
RUN wget -O flutter.tar.xz https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_1.22.2-stable.tar.xz && \
    tar xf ~/flutter.tar.xz
ENV PATH "$PATH:/home/developer/flutter/bin"

WORKDIR /home/developer/flutter_complete_guide/

RUN flutter doctor