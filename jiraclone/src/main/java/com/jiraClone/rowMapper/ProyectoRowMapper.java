package com.jiraClone.rowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.jiraClone.model.Proyecto;

public class ProyectoRowMapper implements RowMapper<Proyecto> {

    @Override
    public Proyecto mapRow(ResultSet rs, int rowNum) throws SQLException {
        Proyecto proyecto = new Proyecto();
        proyecto.setId(rs.getInt("id"));
        proyecto.setNombre(rs.getString("nombre"));
        proyecto.setDescripcion(rs.getString("descripcion"));
        return proyecto;
    }
}