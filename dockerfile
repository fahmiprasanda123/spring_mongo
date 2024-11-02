# Menggunakan image resmi Java sebagai base image
FROM openjdk:17-jdk-slim

# Set direktori kerja dalam kontainer
WORKDIR /app

# Salin file pom.xml dan mvnw ke kontainer
COPY pom.xml .
COPY mvnw .
COPY .mvn ./  # Menggunakan ./ untuk menyalin seluruh folder ke direktori kerja saat ini

# Salin semua kode sumber
COPY src ./src

# Memberikan izin eksekusi pada skrip mvnw
RUN chmod +x mvnw

# Build aplikasi
RUN ./mvnw clean package -DskipTests

# Menjalankan aplikasi
EXPOSE 8080
CMD ["java", "-jar", "target/demo-0.0.1-SNAPSHOT.jar"]  # Sesuaikan dengan nama JAR Anda
