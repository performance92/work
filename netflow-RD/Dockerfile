# Use the Node.js 20 base image
FROM node:20

# Set the working directory in the container
WORKDIR /usr/src/app

# Clone the LogicStudio repository
RUN git clone https://github.com/developmentation/logicstudio.ai.git /usr/src/app

# Change directory to the cloned repository (already set as WORKDIR)
WORKDIR /usr/src/app

# Copy the .env.example to .env
RUN cp .env.example .env

# Install application dependencies
RUN npm install

# Install nodemon globally
RUN npm install -g nodemon

# Expose the port the application runs on
EXPOSE 3000

# Set environment variables if needed (can be overridden at runtime)
ENV NODE_ENV=production

# Start the development server using nodemon
CMD ["nodemon", "index.js"]
