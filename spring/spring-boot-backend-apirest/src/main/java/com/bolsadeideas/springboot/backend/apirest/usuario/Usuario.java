package com.bolsadeideas.springboot.backend.apirest.usuario;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import lombok.Data;

@Data
@Entity
@Table(name = "usuarios")
public class Usuario implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, length = 20)
    private String username;

    @Column(length = 60)
    private String password;

    private Boolean enabled;

//    @NotEmpty(message = "No puede estar vacio")
//    @Size(min = 4, max = 12, message = "El tamaño tiene que estar entre 4 y 12 caracteres")
//    @Column(nullable = false)
    private String nombre;

//    @NotEmpty(message = "No puede estar vacío")
//    @Column(nullable = false)
    private String apellido;

//    @Email(message = "No es una dirección de correo bien formada.")
//    @NotEmpty(message = "No puede estar vacio")
    @Column(unique = true)
    private String email;



    @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "usuarios_roles",
        joinColumns = @JoinColumn(name = "usuario_id"),
        inverseJoinColumns = @JoinColumn(name = "role_id"),
        uniqueConstraints = {@UniqueConstraint(columnNames = {"usuario_id", "role_id"})})
    private List<Role> roles;

    private static final long serialVersionUID = 1L;

}