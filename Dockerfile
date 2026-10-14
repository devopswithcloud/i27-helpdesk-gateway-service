FROM node:24-alpine

# Pull in patched OpenSSL (CVE-2026-31789: libcrypto3/libssl3 fixed in 3.3.7-r0)
#RUN apk upgrade --no-cache libcrypto3 libssl3

WORKDIR /app

# npm install is used to add, update, and manage dependencies during local development, 
# whereas npm ci is designed for strict, reproducible, and fast automated builds in Continuous Integration environments.
COPY package*.json ./
RUN npm ci --omit=dev
COPY . .
EXPOSE 8080
CMD ["npm", "start"]
