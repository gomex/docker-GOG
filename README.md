# GOG no Docker - docker-GOG
Repositório com arquivos para "dockerizar" o sistema GOG: códigos para criar "images" e "containers" do sistema GOG utilizando-se do Docker

## Comandos para utilização do docker neste projeto 

> **Nota**
> - Instale o Docker na sua máquina para utilizar este projeto https://www.docker.com/

### Como usar
Este projeto deve ser utilizado para a montagem e execução do sistema GOG em um ambiente configurado com os serviços oferecidos pelo Docker. 

Para usar este projeto e montar o sistema GOG em sua máquina execute apenas quatro passos principais

> - Baixe o projeto 
```
git clone <URL do projeto>
```
> - Monte as imagens
```
# vá para o diretório 'postgresql_9.3'
cd postgresql_9.3
docker build -t gogdocker:postgresql .
```
```
# vá para o diretório raiz do projeto
docker build -t gogdocker:gog.app .
```
> - Execute os containers
```
# Montagem do container com o Banco de Dados 
docker run --name postgre9.3 -p 5434:5432 -e POSTGRES_USER=clelsonrodrigues -e POSTGRES_DB=GOG -e POSTGRES_PASSWORD=123456 -d gogdocker:postgresql
```
```
# Montagem do container com o Servidor de Aplicação - contendo o sistema GOG
docker run -it -p 8080:8080 -p 9990:9990 -e JBOSS_PASS="jboss" -e HOSTNAMELINK="postgre9.3" --link postgre9.3 --name gog gogdocker:gog.app
```
> - Utilize o sistema
>   - Acesse o sistema utilizando um Browser: http://localhost:8080/GOG

A imagem a seguir ilustra como este projeto deve ser utilizado:
![Como utilizar este projeto](/arquivos/DockerFluxoUtilizacao.jpg)

### Como foi projetado
Projetamos o Docker mantendo em mente o conceito de micro serviços. Neste sentido, dividimos o ambiente de instalação do sistema GOG em dois serviços:

- Um serviço para o Banco de Dados da aplicação
  - utilizando duas imagens: 
    - debian:jessie
    - postgres:9.3 - postgresql 9.3
- Um outro serviço para o Servidor de Aplicação
  - utilizando basicamente:
    - debian:jessie
    - Java7
    - Maven3
    - Git - command line
    - Jboss7.1.1 
    - postgresql-client
    - vim
    - GOG - deploy

A imagem a seguir ilustra a utilização do Docker foi projetada para o sistema GOG; isto ajuda a entender como utilizar o docker para montar os serviços envolvidos:
![Como foi projetada a utilização do Docker no sistema GOG](/arquivos/DockerMontagemAmbiente.jpg)


