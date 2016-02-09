FROM seanleather/lean-emacs
MAINTAINER Sean Leather <https://github.com/spl>

# Set up volume for sharing the server file. Emacs requires that it not be
# readable/writable by anyone else.
RUN mkdir /server && chmod -R go= /server
VOLUME /server

# Configure Emacs as a server
WORKDIR /root
COPY configure-emacs-server.el .emacs

EXPOSE 7734

ENTRYPOINT ["emacs"]
