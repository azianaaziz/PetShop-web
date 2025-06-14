package com.petshop.model;

public class User {
    private int id;
    private String name;
    private String title;
    private String details;
    private String image;

    public User(String name, String title, String details, String image) {
        this.name = name;
        this.title = title;
        this.details = details;
        this.image = image;
    }

    public User(int id, String name, String title, String details, String image) {
        this.id = id;
        this.name = name;
        this.title = title;
        this.details = details;
        this.image = image;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
