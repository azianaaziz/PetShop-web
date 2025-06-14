/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.petshop.model;

/**
 *
 * @author USER
 */
public class Feedback {
    private String title;
    private String name;
    private String subject;
    private String photoPath;

    public Feedback(String title, String name, String subject, String photoPath) {
        this.title = title;
        this.name = name;
        this.subject = subject;
        this.photoPath = photoPath;
    }

    public String getTitle() { return title; }
    public String getName() { return name; }
    public String getSubject() { return subject; }
    public String getPhotoPath() { return photoPath; }
}
