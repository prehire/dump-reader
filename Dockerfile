FROM postgres:latest
RUN echo "Copying initialization script"
COPY ./init/load_dumps.sh /docker-entrypoint-initdb.d