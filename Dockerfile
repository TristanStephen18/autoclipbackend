FROM node:20

# Install ffmpeg and yt-dlp at system level
RUN apt-get update && apt-get install -y ffmpeg python3-pip && pip install -U yt-dlp

WORKDIR /app
COPY package*.json ./
RUN npm ci --ignore-scripts
COPY . .
RUN npm run build

CMD ["npm", "start"]
