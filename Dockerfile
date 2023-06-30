# 使用 Node.js 16 作为基础镜像
FROM node:16

# 拷贝整个应用程序到工作目录
COPY . /app/

# 在容器中创建工作目录
WORKDIR /app/

# 安装依赖
RUN npm install \
    && npm run build


FROM  nginx

COPY . /app/

WORKDIR /app/

COPY ./dist /usr/share/nginx/html/
COPY ./default.conf /etc/nginx/conf.d/

EXPOSE 8099