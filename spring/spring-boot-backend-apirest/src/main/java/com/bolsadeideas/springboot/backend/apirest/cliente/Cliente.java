package com.bolsadeideas.springboot.backend.apirest.cliente;

import com.bolsadeideas.springboot.backend.apirest.factura.Factura;
import com.bolsadeideas.springboot.backend.apirest.usuario.Region;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;

@Data
@Entity
@Table(name = "clientes")
public class Cliente implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty(message = "No puede estar vacio")
    @Size(min = 4, max = 12, message = "El tamaño tiene que estar entre 4 y 12 caracteres")
    @Column(nullable = false)
    private String nombre;

    @NotEmpty(message = "No puede estar vacío")
    @Column(nullable = false)
    private String apellido;

    @Email(message = "No es una dirección de correo bien formada.")
    @NotEmpty(message = "No puede estar vacio")
    @Column(nullable = false, unique = true)
    private String email;

    @NotNull(message = "No fecha no puede estar vacia")
    @Column(name = "created_at")
    @Temporal(TemporalType.DATE)
    private Date createdAt;

//    @PrePersist
//    public void prePersist() {
//        createdAt = new Date();
//    }

    private String foto;

    @NotNull(message = "La región no puede estar vacía")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "region_id")
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    private Region region;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "cliente", cascade = CascadeType.ALL)
    @JsonIgnoreProperties(value = {"cliente", "hibernateLazyInitializer", "handler"}, allowSetters = true)
    private List<Factura> facturas;

    private static final long serialVersionUID = 1L;

    public Cliente() {
        facturas = new ArrayList<>();
    }
}


