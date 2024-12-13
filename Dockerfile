# Use the official Node.js image as a base
FROM node:16-slim

# Set the working directory inside the container
WORKDIR /app

# Install system dependencies (including git)
RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy the package.json and package-lock.json files into the container
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Copy the rest of the application code into the container
COPY . .

# Expose the port the app runs on (if needed)
EXPOSE 3000  # Replace with your app's port if it's different

# Define the command to start the app
CMD ["node", "your_app.js"]  # Replace "your_app.js" with your actual entry point file
