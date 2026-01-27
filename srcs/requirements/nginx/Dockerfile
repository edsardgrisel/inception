# syntax=docker/dockerfile:1

FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y nginx
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]