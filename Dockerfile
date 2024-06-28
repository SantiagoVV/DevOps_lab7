# Usar una imagen base de Node.js
FROM node:14

# Crear y establecer el directorio de trabajo
WORKDIR /app

# Copiar package.json y package-lock.json
COPY package*.json ./

# Instalar las dependencias globalmente y localmente
RUN npm install -g concurrently parcel
RUN npm install

# Copiar el resto del código de la aplicación
COPY . .

# Construir el cliente
RUN cd client && npm install
RUN cd server && npm install
RUN cd client && npm run build

# Exponer el puerto que la aplicación utilizará
EXPOSE 4100

# Comando para ejecutar la aplicación
CMD ["npm", "start"]

