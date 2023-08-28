FROM ghcr.io/boltops-tools/terraspace:ubuntu

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME
RUN useradd --uid $USER_UID --gid $USER_GID --create-home --home-dir /home/$USERNAME --shell /bin/bash $USERNAME
RUN apt-get update
RUN apt-get install -y sudo
RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME
RUN chmod 0440 /etc/sudoers.d/$USERNAME
# RUN chown -R $USERNAME:$USERNAME /opt/terraspace

# COPY user-mapping.sh /
# RUN chmod u+x /user-mapping.sh

# ENTRYPOINT ["/user-mapping.sh"]

# ********************************************************
# * Anything else you want to do like clean up goes here *
# ********************************************************

# [Optional] Set the default user. Omit if you want to keep the default as root.
USER $USERNAME
