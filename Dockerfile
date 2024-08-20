# Etapa 1: Construção da aplicação
FROM node:18 AS build

# Definir diretório de trabalho
WORKDIR /app

# Copiar arquivos de configuração
COPY package*.json ./

# Instalar dependências
RUN npm install

# Copiar o restante dos arquivos do projeto
COPY . .

# Construir a aplicação
RUN npm run build

# Etapa 2: Configuração do servidor
FROM nginx:alpine

# Copiar arquivos construídos para o diretório do Nginx
COPY --from=build /app/dist /usr/share/nginx/html

# Expor a porta que o Nginx irá escutar
EXPOSE 80

# Iniciar o Nginx
CMD ["nginx", "-g", "daemon off;"]