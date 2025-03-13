package com.jiraClone.repository;

import java.util.List;

import com.jiraClone.model.Sprint;

public interface SprintRepository {

	 List<Sprint> findByProyectoId(int idProyecto);

	 void save(Sprint sprint);

	 List<Sprint> getAllSprint();
}
