FROM node:18-alpine

WORKDIR /app

# npm install is used to add, update, and manage dependencies during local development, 
# whereas npm ci is designed for strict, reproducible, and fast automated builds in Continuous Integration environments.
COPY package*.json ./
RUN npm ci --omit=dev
COPY . .
EXPOSE 8080

CMD ["npm", "start"]