package com.jiraClone.repository;

import java.util.List;

import com.jiraClone.model.SprintBacklogItem;

public interface SprintBacklogItemRepository {

	public List<SprintBacklogItem> findByProyectoId(int idProyecto);
	public void save(SprintBacklogItem item) ;
}
