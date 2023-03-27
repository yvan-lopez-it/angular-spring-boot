package com.bolsadeideas.springboot.backend.apirest.factura;

import org.springframework.data.repository.CrudRepository;

public interface IFacturaDao extends CrudRepository<Factura, Long> {

}
