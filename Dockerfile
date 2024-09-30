# 1. 빌드
FROM node:20 as build

# 2. 작업 디렉토리 생성
WORKDIR /app

# 3. package.json 및 package-lock.json 파일을 복사하고 의존성 설치
COPY package*.json ./
RUN npm install

# 4. 소스 코드 복사 및 빌드
COPY . ./
RUN npm run build

# 5. Nginx를 사용하여 빌드된 파일을 서빙
FROM nginx:alpine

# 6. 빌드된 파일 및 설정파일을 Nginx 기본 경로로 복사
COPY --from=build /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

# 7. 포트 설정
EXPOSE 80

# 8. 컨테이너 실행 시 Nginx 실행되도록 설정
CMD ["nginx", "-g", "daemon off;"]
