CREATE DATABASE IF NOT exists dios;
USE dios;

-- Cria a tabela Departamentos
CREATE TABLE IF NOT EXISTS persion_filter (
    id INT AUTO_INCREMENT PRIMARY KEY,
    filter VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS migrations_prod (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    run_on VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS migrations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    run_on VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS metadata (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    run_on VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    picture_url VARCHAR(255) NOT NULL,
    locale VARCHAR(255) NOT NULL,
    preferences VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS public_api_user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(255) NOT NULL,
    id_user int,
    FOREIGN KEY (id_user) REFERENCES user(id)
);

CREATE TABLE IF NOT EXISTS audit (
    timestamp VARCHAR(255) NOT NULL,
    id_user int,
    context_id int, 
    parameters VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_user) REFERENCES user(id)
);

CREATE TABLE IF NOT EXISTS oidc_user (
    id_user int,
    sub int, 
    tid int, 
    FOREIGN KEY (id_user) REFERENCES user(id)
);

CREATE TABLE IF NOT EXISTS permission (
    id INT AUTO_INCREMENT PRIMARY KEY
);

CREATE INDEX idx_permission_id ON permission(id);

CREATE TABLE IF NOT EXISTS permission_role_has_permission (
    id INT,
    permission_id INT, 
    FOREIGN KEY (permission_id) REFERENCES permission(id)
);

CREATE TABLE IF NOT EXISTS permission_role (
    id INT AUTO_INCREMENT PRIMARY KEY
);

CREATE INDEX idx_permission_role_id ON permission_role(id);

CREATE TABLE IF NOT EXISTS user_has_permission_role (
    id_permission_role INT,
    id_user INT,
    id_relation INT,
    FOREIGN KEY (id_permission_role) REFERENCES permission_role(id),
    FOREIGN KEY (id_user) REFERENCES user(id)
);
CREATE TABLE IF NOT EXISTS user_role_context (
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_permission_role INT,
    id_user INT,
    id_relation INT,
    type VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_permission_role) REFERENCES permission_role(id)
);

CREATE TABLE IF NOT EXISTS user_role_context_location (
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_user_role_context INT,
    FOREIGN KEY (id_user_role_context) REFERENCES user_role_context(id)
);

CREATE TABLE IF NOT EXISTS user_role_context_aplication (
	id INT AUTO_INCREMENT PRIMARY KEY,
    id_user_role_context INT,
    FOREIGN KEY (id_user_role_context) REFERENCES user_role_context(id)
);




