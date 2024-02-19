FROM employee-service-base:latest as build

WORKDIR /usr/src/app

COPY . .

RUN npm run build

FROM employee-service-prod:latest as prod

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/dist ./dist

CMD ["node", "dist/main"]