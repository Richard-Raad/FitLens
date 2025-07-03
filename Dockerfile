# Use a lightweight Node base image
FROM node:22-alpine
WORKDIR /app

# 1) Install API dependencies
COPY api/package*.json api/
RUN cd api && npm ci

# 2) Copy over your API source
COPY api/ api/

# 3) Copy the pre-built Vite frontend (you must run `npm run build` in web/ first)
COPY web/dist public/

# 4) Expose port & start your server
EXPOSE 80
ENV PORT=80
CMD ["node", "api/src/index.js"]
