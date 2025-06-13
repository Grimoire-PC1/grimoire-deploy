# backend/Dockerfile
FROM amazoncorretto:21-alpine3.18

# Define working directory.
WORKDIR /root

# Install.
RUN apk update && \
    apk upgrade && \
    apk add --no-cache build-base \
                       curl \
                       git \
                       htop \
                       unzip \
                       vim \
                       wget \
                       maven \
                       net-tools \
                       iputils \
                       openssl

# Clona o repositório diretamente do GitHub
RUN git clone https://github.com/Grimoire-PC1/grimoire-backend.git && \
    (cd grimoire-backend && mvn install -Dmaven.test.skip=true)

WORKDIR /root/grimoire-backend

COPY ./resources /root/grimoire-backend/src/main/resources

# Gere a chave privada usando openssl
RUN openssl genpkey -algorithm RSA -out /root/grimoire-backend/src/main/resources/private.pem

# Gere a chave pública a partir da chave privada
RUN openssl rsa -pubout -in /root/grimoire-backend/src/main/resources/private.pem -out /root/grimoire-backend/src/main/resources/public.pem

RUN \
  mvn dependency:sources

CMD ["mvn", "spring-boot:run"]