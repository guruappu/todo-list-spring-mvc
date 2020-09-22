package com.guru.spring.security.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;


import com.guru.spring.security.login.Register;
import com.guru.spring.security.model.Task;
import com.guru.spring.security.rowmapper.RegisterRowMapper;

@Repository
public class LogInDaoImpl extends BaseDao implements LogInDao {
	
	

	@Override
	public void saveUser(Register theRegister) {
		
		String sql="Insert into user_new(name,username,password,email)" 
		+"values(:name,:username,:password,:email)";
		
		Map m = new HashMap();
		m.put("name", theRegister.getName());
		m.put("username", theRegister.getUsername());
		m.put("password", theRegister.getPassword());
		m.put("email", theRegister.getEmail());
		
		KeyHolder kh = new GeneratedKeyHolder();
		SqlParameterSource ps = new MapSqlParameterSource(m);
		super.getNamedParameterJdbcTemplate().update(sql, ps, kh);
	    Integer userId = (Integer) kh.getKey().intValue();
	    theRegister.setId(userId);
	}

	

	
}
