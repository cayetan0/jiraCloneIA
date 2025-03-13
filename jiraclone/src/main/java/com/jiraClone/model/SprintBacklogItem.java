package com.jiraClone.model;


public class SprintBacklogItem {
    private int id;
    private int idSprint;
    private int idItem;
    private String titulo;
    private String descripcion;
    private String sprintNombre;
    private String sprintDescripcion;

    // Getters y Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdSprint() {
        return idSprint;
    }

    public void setIdSprint(int idSprint) {
        this.idSprint = idSprint;
    }

    public int getIdItem() {
        return idItem;
    }

    public void setIdItem(int idItem) {
        this.idItem = idItem;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getSprintNombre() {
        return sprintNombre;
    }

    public void setSprintNombre(String sprintNombre) {
        this.sprintNombre = sprintNombre;
    }

    public String getSprintDescripcion() {
        return sprintDescripcion;
    }

    public void setSprintDescripcion(String sprintDescripcion) {
        this.sprintDescripcion = sprintDescripcion;
    }
}