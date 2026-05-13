package fr.ubdx.net.model;

import java.io.Serializable;

public class Reservation implements Serializable {
    private static final long serialVersionUID = 1L;
    
    private String id;
    private String clientName;
    private int numberOfPeople;
    private String datetime;

    public Reservation(String id, String clientName, int numberOfPeople, String datetime) {
        this.id = id;
        this.clientName = clientName;
        this.numberOfPeople = numberOfPeople;
        this.datetime = datetime;
    }

    // Getters and Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getClientName() { return clientName; }
    public void setClientName(String clientName) { this.clientName = clientName; }
    public int getNumberOfPeople() { return numberOfPeople; }
    public void setNumberOfPeople(int numberOfPeople) { this.numberOfPeople = numberOfPeople; }
    public String getDatetime() { return datetime; }
    public void setDatetime(String datetime) { this.datetime = datetime; }
}