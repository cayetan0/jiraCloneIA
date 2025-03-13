package com.jiraClone.repository;

import com.jiraClone.model.Sprint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SprintRepositoryImp {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Sprint> findByProyectoId(int idProyecto) {
        String sql = "SELECT * FROM Sprint WHERE id_proyecto = ?";
        return jdbcTemplate.query(sql, new Object[]{idProyecto}, (rs, rowNum) -> {
            Sprint sprint = new Sprint();
            sprint.setId(rs.getInt("id"));
            sprint.setNombre(rs.getString("nombre"));
            sprint.setDescripcion(rs.getString("descripcion"));
            sprint.setIdProyecto(rs.getInt("id_proyecto"));
            sprint.setFechaInicio(rs.getTimestamp("fecha_inicio"));
            sprint.setFechaFin(rs.getTimestamp("fecha_fin"));
            return sprint;
        });
    }

    public void save(Sprint sprint) {
        String sql = "INSERT INTO Sprint (nombre, descripcion, fecha_inicio, fecha_fin, id_proyecto) VALUES (?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, sprint.getNombre(), sprint.getDescripcion(), sprint.getFechaInicio(), sprint.getFechaFin(), sprint.getIdProyecto());
    }

	public List<Sprint> geltAllSprint() {
		 String sql = "SELECT * FROM Sprint ";
	        return jdbcTemplate.query(sql, (rs, rowNum) -> {
	            Sprint sprint = new Sprint();
	            sprint.setId(rs.getInt("id"));
	            sprint.setNombre(rs.getString("nombre"));
	            sprint.setDescripcion(rs.getString("descripcion"));	          
	            sprint.setIdProyecto(rs.getInt("id_proyecto"));
	            sprint.setFechaInicio(rs.getTimestamp("fecha_inicio"));
	            sprint.setFechaFin(rs.getTimestamp("fecha_fin"));
	            return sprint;
	        });
	}
	  
	
}