FROM postgres:9.3
RUN localedef -i pt_BR -c -f UTF-8 -A /usr/share/locale/locale.alias pt_BR.UTF-8

# Configura o locale para pt_BR.UTF-8
ENV LANG pt_BR.UTF-8
ENV LC_ALL pt_BR.UTF-8

# Inclui arquivo para execução (conforme previsto no ENTRYPOINT da imagem original - ver docker-entrypoint.sh)
COPY run.sh /docker-entrypoint-initdb.d/

RUN echo "Utilize o seguinte padrão de comando para utilizar esta imagem: " && \
    echo "docker run --name postgre9.3 -p 5434:5432 -e POSTGRES_USER=clelsonrodrigues -e POSTGRES_DB=dbouvidoria -e POSTGRES_PASSWORD=123456 -d gogdocker:postgresql"  

