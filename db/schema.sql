create table member (
    member_id BINARY(8) NOT NULL,
    user_name VARCHAR(32) NOT NULL,
    password VARBINARY(156) NOT NULL,
    created DATETIME NOT NULL,
    PRIMARY KEY (`member_id`)
) ENGINE=Innodb DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci;