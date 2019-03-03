# The FROM instruction initializes a new build stage and sets the Base Image for subsequent instructions.
FROM node:10

# The WORKDIR instruction sets the working directory for any RUN, CMD, ENTRYPOINT, COPY and ADD instructions that follow it in the Dockerfile
WORKDIR /usr/src/

# The RUN instruction will execute any commands in a new layer on top of the current image and commit the results
RUN npm install

# The COPY instruction copies new files or directories from <src> and adds them to the filesystem of the container at the path 
COPY . .

# The EXPOSE instruction informs Docker that the container listens on the specified network ports at runtime.
EXPOSE 8080

# The main purpose of a CMD is to provide defaults for an executing container. (only one per docker file)
CMD [ "npm", "start" ]