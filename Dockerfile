# เลือก PHP base image ที่ต้องการใช้
FROM php:7.4-apache

# ติดตั้ง extensions หรือ dependencies ที่ต้องการ (ตัวอย่างเช่น pdo_mysql เพื่อใช้งานกับ MySQL database)
RUN docker-php-ext-install pdo_mysql

# กําหนด working directory ของแอปพลิเคชัน
WORKDIR /var/www/html

# คัดลอกโค้ดของแอปพลิเคชันเข้าไปใน Docker image
COPY . .

# ปรับแต่งค่า Apache เพื่อให้แอปพลิเคชันทำงานได้ถูกต้อง (เช่นการ rewrite URL)
RUN a2enmod rewrite

# กําหนด environment variables ต่าง ๆ ตามความต้องการ
ENV APACHE_DOCUMENT_ROOT /var/www/html/public
ENV APACHE_LOG_DIR /var/log/apache2

# Expose port 80 เพื่อให้สามารถเข้าถึงเว็บแอปพลิเคชันผ่านเบราว์เซอร์
EXPOSE 8000

# คําสั่งเริ่มต้น Apache server เมื่อ Docker container ถูกเริ่มขึ้น
CMD ["apache2-foreground"]
