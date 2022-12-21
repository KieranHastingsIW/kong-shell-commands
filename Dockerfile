FROM curlimages/curl:latest
USER root
COPY script.sh /temp/script.sh
RUN chmod +x /temp/script.sh
USER 1001
ENTRYPOINT ["/temp/script.sh"]


