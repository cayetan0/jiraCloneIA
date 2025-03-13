package com.jiraClone.service;


import com.jiraClone.model.Sprint;
import com.jiraClone.repository.SprintRepositoryImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SprintService {

    @Autowired
    private SprintRepositoryImp sprintRepository;

    public List<Sprint> getSprintsByProyectoId(int idProyecto) {
        return sprintRepository.findByProyectoId(idProyecto);
    }

    public void saveSprint(Sprint sprint) {
        sprintRepository.save(sprint);
    }

	public List<Sprint> getAllSprint() {
		return sprintRepository.geltAllSprint();
	}
}