package com.bolsadeideas.springboot.backend.apirest.cliente;

import com.bolsadeideas.springboot.backend.apirest.usuario.Region;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface IClienteDao extends JpaRepository<Cliente, Long> {

  @Query("from Region")
  List<Region> findAllRegiones();

}
