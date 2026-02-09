package com.multicloud.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("MySQL Driver Loaded");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3307/multicloud?useSSL=false&serverTimezone=UTC",
                "root",
                "root"
            );

            System.out.println("DATABASE CONNECTED SUCCESSFULLY");
            return con;

        } catch (Exception e) {
            System.out.println("DATABASE CONNECTION FAILED");
            e.printStackTrace();
            return null;
        }
    }
}

