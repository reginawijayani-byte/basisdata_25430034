CREATE DATABASE IF NOT EXISTS kopma_34
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

CREATE USER IF NOT EXISTS 'mhs_34'@'localhost'
    IDENTIFIED BY '<kucing>';

GRANT ALL PRIVILEGES ON kopma_34.* TO 'mhs_34'@'localhost';