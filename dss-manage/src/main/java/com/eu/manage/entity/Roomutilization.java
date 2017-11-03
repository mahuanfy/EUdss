package com.eu.manage.entity;

public class Roomutilization {
    private String month;
    private String year;
    private String utilizationRate;
    private String type;

    public Roomutilization() {
    }

    public Roomutilization(String month, String year, String utilizationRate, String type) {
        this.month = month;
        this.year = year;
        this.utilizationRate = utilizationRate;
        this.type = type;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getUtilizationRate() {
        return utilizationRate;
    }

    public void setUtilizationRate(String utilizationRate) {
        this.utilizationRate = utilizationRate;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "Roomutilization{" +
                "month='" + month + '\'' +
                ", year='" + year + '\'' +
                ", utilizationRate='" + utilizationRate + '\'' +
                ", type='" + type + '\'' +
                '}';
    }
}
