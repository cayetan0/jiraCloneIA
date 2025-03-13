package com.jiraClone.repository;

import com.jiraClone.model.SprintBacklogItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SprintBacklogItemRepositoryImp {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<SprintBacklogItem> findByProyectoId(int idProyecto) {
        String sql = "SELECT sbi.*, pbi.titulo, pbi.descripcion, s.nombre AS sprintNombre, s.descripcion AS sprintDescripcion " +
                     "FROM SprintBacklogItem sbi " +
                     "JOIN ProductBacklogItem pbi ON sbi.id_item = pbi.id " +
                     "JOIN Sprint s ON sbi.id_sprint = s.id " +
                     "WHERE pbi.id_proyecto = ?";
        return jdbcTemplate.query(sql, new Object[]{idProyecto}, (rs, rowNum) -> {
            SprintBacklogItem item = new SprintBacklogItem();
            item.setId(rs.getInt("id"));
            item.setIdSprint(rs.getInt("id_sprint"));
            item.setIdItem(rs.getInt("id_item"));
            item.setTitulo(rs.getString("titulo"));
            item.setDescripcion(rs.getString("descripcion"));
            item.setSprintNombre(rs.getString("sprintNombre"));
            item.setSprintDescripcion(rs.getString("sprintDescripcion"));
            return item;
        });
    }

    public void save(SprintBacklogItem item) {
        String sql = "INSERT INTO SprintBacklogItem (id_sprint, id_item) VALUES (?, ?)";
        jdbcTemplate.update(sql, item.getIdSprint(), item.getIdItem());
    }
}