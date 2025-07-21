# Stage 1: Build Tailwind CSS with Node
FROM node:20-alpine AS node_builder

WORKDIR /app

# Copy package files and install Tailwind
COPY package.json package-lock.json ./
RUN npm install -D tailwindcss@4.1.11

# Copy Tailwind input file
COPY static/tailwind_input.css ./static/tailwind_input.css

# Build Tailwind CSS
RUN npx tailwindcss -i ./static/tailwind_input.css -o ./static/style.css

# Stage 2: Final Python app image
FROM python:3.10-slim

WORKDIR /app

# Install Python dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy app files
COPY . .

# Copy built CSS from Node stage
COPY --from=node_builder /app/static/style.css ./static/style.css

# Expose port
EXPOSE 5000

# Run app
CMD ["python", "app.py"]
