package com.bolsadeideas.springboot.backend.apirest.cliente;

import com.bolsadeideas.springboot.backend.apirest.factura.Factura;
import com.bolsadeideas.springboot.backend.apirest.producto.Producto;
import com.bolsadeideas.springboot.backend.apirest.usuario.Region;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IClienteService {

    List<Cliente> findAll();

    Page<Cliente> findAll(Pageable pageable);

    Cliente findById(Long id);

    Cliente save(Cliente cliente);

    void delete(Long id);

    List<Region> findAllRegiones();

    Factura findFacturaById(Long id);

    Factura saveFactura(Factura factura);

    void deleteFacturaById(Long id);

    List<Producto> findProductoByNombre(String term);
}
