# ---- Stage 1: Building application ----
#FROM node:20 AS builder
FROM golang:1.22 AS builder
WORKDIR /app 
COPY . .
#RUN npm install && npm run build 
RUN go build -o myapp main.go


# ---- Stage 2: Serve application ----
FROM alpine:latest 
#COPY --from=builder /app/dist /usr/share/nginx/html
COPY --from=builder /app/myapp /usr/local/bin/myapp
CMD ['/usr/local/bin/myapp']

