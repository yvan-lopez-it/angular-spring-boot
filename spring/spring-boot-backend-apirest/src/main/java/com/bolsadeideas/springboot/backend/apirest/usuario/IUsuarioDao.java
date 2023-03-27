package com.bolsadeideas.springboot.backend.apirest.usuario;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface IUsuarioDao extends CrudRepository<Usuario, Long> {

    Usuario findByUsername(String userName);

    @Query("select u from Usuario u where u.username = ?1")
    Usuario findByUsername2(String userName);

}
