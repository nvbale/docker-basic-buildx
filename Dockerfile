# /app

FROM node:19.2-alpine3.16
# FROM --platform=linux/arm64 node:19.2-alpine3.16
# FROM --platform=$BUILDPLATFORM node:19.2-alpine3.16

# cd app
WORKDIR /app

# Dest /app
COPY package.json ./

# Instalar las dependencias
RUN npm install

# Dest /app
COPY . .

# Realizar testing
RUN npm run test

# Eliminar archivos y directorios no usados en PROD
RUN rm -rf tests && rm -rf node_modules

# Unicamente las dependencias de producción
RUN npm install --prod

# Comando para ejecutar la aplicación
CMD ["node", "app.js"]