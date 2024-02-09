FROM node:alpine3.18 as build-stage
WORKDIR /app
COPY . .
RUN ["npm", "install"]
RUN ["npm", "run", "build"]
CMD ["npm", "start"]

FROM node:alpine3.18 as prod-stage
WORKDIR /app
COPY --from=build-stage /app/dist /app/dist
COPY --from=build-stage /app/package*.json /app/
RUN ["npm", "install", "--omit=dev"]
EXPOSE 3000
CMD ["npm", "start"]