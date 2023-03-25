package com.bolsadeideas.springboot.backend.apirest.models.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import lombok.Data;

@Data
@Entity
@Table(name = "facturas")
public class Factura implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String descripcion;
    private String observacion;

    @Column(name = "created_at")
    @Temporal(TemporalType.DATE)
    private Date createdAt;

    @PrePersist
    public void prePersist() {
        this.createdAt = new Date();
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JsonIgnoreProperties({"facturas", "hibernateLazyInitializer", "handler"})
    private Cliente cliente;

    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "factura_id")
    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    private List<ItemFactura> items;

    private static final long serialVersionUID = 1L;

    public Factura() {
        items = new ArrayList<>();
    }

    public Double getTotal() {
        Double total = 0.00;
        for (ItemFactura item : items) {
            total += item.getImporte();
        }

        return total;
    }
}
