# Base image
FROM openjdk:17-slim

# Set environment variables
ENV AWS_REGION=us-east-1

# Copy Nessie Garbage Collection CLI jar or tool from GitHub Container Registry
ADD https://ghcr.io/projectnessie/nessie-gc:0.101.3 /usr/local/bin/nessie-gc

# Make nessie-gc executable
RUN chmod +x /usr/local/bin/nessie-gc

# Set the default command to run the garbage collection
CMD ["nessie-gc", "gc", "-I", "--iceberg", "s3.access-key-id=admin,s3.secret-access-key=password,s3.endpoint=http://localhost:9000/warehouse", "--inmemory"]
