package com.jiraClone.repository;

import com.jiraClone.model.Proyecto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.jiraClone.rowMapper.*;

import java.util.List;

@Repository
public class ProyectoRepositoryImp implements ProyectoRepository{

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Proyecto> findAll() {
        String sql = "SELECT * FROM Proyecto";
        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            Proyecto proyecto = new Proyecto();
            proyecto.setId(rs.getInt("id"));
            proyecto.setNombre(rs.getString("nombre"));
            proyecto.setDescripcion(rs.getString("descripcion"));
            proyecto.setFechaCreacion(rs.getTimestamp("fecha_creacion"));
            return proyecto;
        });
    }

    public void save(Proyecto proyecto) {
        String sql = "INSERT INTO Proyecto (nombre, descripcion) VALUES (?, ?)";
        jdbcTemplate.update(sql, proyecto.getNombre(), proyecto.getDescripcion());
    }
    
    public Proyecto findById(int id) {
        String sql = "SELECT * FROM Proyecto WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, new ProyectoRowMapper());
    }
}