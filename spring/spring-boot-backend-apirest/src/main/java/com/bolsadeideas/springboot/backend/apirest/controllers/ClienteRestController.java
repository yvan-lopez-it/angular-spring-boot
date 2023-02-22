package com.bolsadeideas.springboot.backend.apirest.controllers;

import com.bolsadeideas.springboot.backend.apirest.models.entity.Cliente;
import com.bolsadeideas.springboot.backend.apirest.models.services.IClienteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@CrossOrigin(origins = {"http://localhost:4200"})
@RestController
@RequestMapping("/api")
public class ClienteRestController {

    @Autowired
    private IClienteService clienteService;

    @GetMapping("/clientes")
    public List<Cliente> index() {
        return clienteService.findAll();
    }

    @GetMapping("/clientes/{id}")
    public ResponseEntity<?> show(@PathVariable Long id) {

        Cliente cliente = null;
        Map<String, Object> response = new HashMap<>();

        try {
            cliente = clienteService.findById(id);
        } catch (DataAccessException dae) {
            response.put("mensaje", "Error al realizar la consulta en la base de datos");
            response.put("error", dae.getMessage().concat(": ").concat(dae.getMostSpecificCause().getMessage()));
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }

        if (cliente == null) {
            response.put("mensaje", "El cliente ID: ".concat(id.toString()).concat(" no existe en la base de datos!"));
            return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity<>(cliente, HttpStatus.OK);
    }

    @PostMapping("/clientes")
    public ResponseEntity<?> create(@RequestBody Cliente cliente) {
        Cliente clienteNew = null;
        Map<String, Object> response = new HashMap<>();
        try {
            clienteNew = clienteService.save(cliente);
        } catch (DataAccessException dae) {
            response.put("mensaje", "Error al realizar el insert en la base de datos");
            response.put("error", dae.getMessage().concat(": ").concat(dae.getMostSpecificCause().getMessage()));
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }

        response.put("mensaje", "El cliente ha sido creado con éxito!");
        response.put("cliente", clienteNew);

        return new ResponseEntity<>(response, HttpStatus.CREATED);
    }

    @PutMapping("/clientes/{id}")
    public ResponseEntity<?> update(@RequestBody Cliente cliente, @PathVariable Long id) {
        Cliente clienteActual = clienteService.findById(id);
        Cliente clienteUpdated = null;

        Map<String, Object> response = new HashMap<>();

        if (clienteActual == null) {
            response.put("mensaje", "Error: No se pudo editar. El cliente ID: "
                    .concat(id.toString())
                    .concat(" no existe en la base de datos!"));
            return new ResponseEntity<>(response, HttpStatus.NOT_FOUND);
        }

        try {
            clienteActual.setApellido(cliente.getApellido());
            clienteActual.setNombre(cliente.getNombre());
            clienteActual.setEmail(cliente.getEmail());

            clienteUpdated = clienteService.save(clienteActual);

        } catch (DataAccessException dae) {
            response.put("mensaje", "Error al actualizar el insert en la base de datos");
            response.put("error", dae.getMessage()
                    .concat(": ")
                    .concat(dae.getMostSpecificCause().getMessage()));
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }

        response.put("mensaje", "El cliente ha sido creado con éxito!");
        response.put("cliente", clienteUpdated);

        return new ResponseEntity<>(response, HttpStatus.CREATED);

    }

    @DeleteMapping("/clientes/{id}")
    //@ResponseStatus(HttpStatus.NO_CONTENT)
    public ResponseEntity<?> delete(@PathVariable Long id) {

        Map<String, Object> response = new HashMap<>();

        try {
            clienteService.delete(id);
        } catch (DataAccessException dae) {
            response.put("mensaje", "Error al eliminar el cliente de la base de datos");
            response.put("error", dae.getMessage()
                    .concat(": ")
                    .concat(dae.getMostSpecificCause().getMessage()));
            return new ResponseEntity<>(response, HttpStatus.INTERNAL_SERVER_ERROR);
        }

        response.put("mensaje", "El cliente ha sido eliminado con éxito!");

        return new ResponseEntity<>(response, HttpStatus.OK);

    }
}