import { Component, OnInit } from '@angular/core';
import { FacturaModel } from '../../models/facturas/factura.model';
import { ClienteService } from '../../services/cliente.service';
import { ActivatedRoute, Router } from '@angular/router';
import { FormControl, NgForm } from '@angular/forms';
import { map, mergeMap, Observable } from 'rxjs';
import { FacturaService } from '../../services/factura.service';
import { ProductoModel } from '../../models/facturas/producto.model';
import { MatAutocompleteSelectedEvent } from '@angular/material/autocomplete';
import { ItemFacturaModel } from '../../models/facturas/item-factura.model';
import swal from 'sweetalert2';

@Component({
  selector: 'app-facturas',
  templateUrl: './facturas.component.html',
})
export class FacturasComponent implements OnInit {

  titulo: string = 'Nueva Factura';
  factura: FacturaModel = new FacturaModel();
  autocompleteControl = new FormControl('');

  productosFiltrados: Observable<ProductoModel[]>;

  constructor(private clienteService: ClienteService,
              private facturaService: FacturaService,
              private router: Router,
              private activatedRoute: ActivatedRoute) {
  }

  ngOnInit(): void {
    this.activatedRoute.paramMap.subscribe(params => {
      let clienteId = +params.get('clienteId');
      this.clienteService.getCliente(clienteId).subscribe(cliente => {
        this.factura.cliente = cliente;
      });
    });

    this.productosFiltrados = this.autocompleteControl.valueChanges
      .pipe(
        map(value => {
          if (typeof value === 'string') {
            return value;
          }
          let prod = value as ProductoModel;
          return prod.nombre;
        }),
        mergeMap(value => value ? this._filter(value) : []),
      );
  }


  private _filter(value: string): Observable<ProductoModel[]> {
    const filterValue = value.toLowerCase();
    return this.facturaService.filtrarProductos(filterValue);
  }

  public mostrarNombre(producto?: ProductoModel): string | undefined {
    return producto ? producto.nombre : undefined;
  }

  public seleccionarProducto(event: MatAutocompleteSelectedEvent): void {
    let producto = event.option.value as ProductoModel;
    console.log(producto);

    if (this.existeItem(producto.id)) {
      this.incrementaCantidad(producto.id);
    } else {
      let nuevoItem = new ItemFacturaModel();
      nuevoItem.producto = producto;
      this.factura.items.push(nuevoItem);
    }

    this.autocompleteControl.setValue('');
    event.option.focus();
    event.option.deselect();

  }

  acutalizarCantidad(id: number, event: any) {
    let cantidad: number = event.target.value as number;

    if (cantidad == 0) {
      return this.eliminarItemFactura(id);
    }

    this.factura.items = this.factura.items.map((item: ItemFacturaModel) => {
      if (id === item.producto.id) {
        item.cantidad = cantidad;
      }
      return item;
    });


  }

  existeItem(id: number): boolean {
    let existe = false;
    this.factura.items.forEach((item: ItemFacturaModel) => {
      if (id === item.producto.id) {
        existe = true;
      }
    });

    return existe;
  }

  incrementaCantidad(id: number): void {
    this.factura.items = this.factura.items.map((item: ItemFacturaModel) => {
      if (id === item.producto.id) {
        ++item.cantidad;
      }
      return item;
    });
  }

  eliminarItemFactura(id: number): void {
    this.factura.items = this.factura.items.filter((item: ItemFacturaModel) => id !== item.producto.id);
  }

  create(facturaForm: NgForm) {
    console.log(this.factura);

    if (this.factura.items.length == 0) {
      this.autocompleteControl.setErrors({ 'invalid': true });
    }

    if (facturaForm.form.valid && this.factura.items.length > 0) {
      this.facturaService.create(this.factura).subscribe(factura => {
        swal.fire(this.titulo, `Factura ${ factura.descripcion } creada con éxito`, 'success');
        this.router.navigate([ '/facturas', factura.id ]);
      });
    }
  }
}
