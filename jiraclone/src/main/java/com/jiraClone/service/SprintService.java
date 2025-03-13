package com.jiraClone.service;

import java.util.List;

import com.jiraClone.model.Sprint;

public interface SprintService {
	
	public List<Sprint> getSprintsByProyectoId(int idProyecto);
    public void saveSprint(Sprint sprint);
	public List<Sprint> getAllSprint();

}
