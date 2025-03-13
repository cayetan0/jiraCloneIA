package com.jiraClone.service;

import java.util.List;

import com.jiraClone.model.SprintBacklogItem;

public interface SprintBacklogItemService {
	
	public List<SprintBacklogItem> getItemsByProyectoId(int idProyecto); 
    public void saveItem(SprintBacklogItem item) ;
	

}
