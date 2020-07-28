FROM node:alpine AS stage-build
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=stage-build /app/build /usr/share/nginx/html


