package com.eu.manage.entity;

public class StudentNumber {
    private int id;
    private String grade;
    private int ndergraduate;
    private int specialty;
    private int upgraded;

    public int getUpgraded() {
        return upgraded;
    }

    public void setUpgraded(int upgraded) {
        this.upgraded = upgraded;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public int getNdergraduate() {
        return ndergraduate;
    }

    public void setNdergraduate(int ndergraduate) {
        this.ndergraduate = ndergraduate;
    }

    public int getSpecialty() {
        return specialty;
    }

    public void setSpecialty(int specialty) {
        this.specialty = specialty;
    }
}
