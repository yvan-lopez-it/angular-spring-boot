import { Component, OnInit } from '@angular/core';
import { FacturaModel } from '../../models/facturas/factura.model';
import { ClienteService } from '../../services/cliente.service';
import { ActivatedRoute } from '@angular/router';
import { FormControl } from '@angular/forms';
import { map, Observable, startWith } from 'rxjs';

@Component({
  selector: 'app-facturas',
  templateUrl: './facturas.component.html',
})
export class FacturasComponent implements OnInit {

  titulo: string = 'Nueva Factura';
  factura: FacturaModel = new FacturaModel();
  autocompleteControl = new FormControl('');
  productos: string[] = [ 'Mesa', 'Silla', 'Pc', 'Carril', 'Guitarra' ];
  productosFiltrados: Observable<string[]>;

  constructor(private clienteService: ClienteService, private activatedRoute: ActivatedRoute) {
  }

  ngOnInit(): void {
    this.activatedRoute.paramMap.subscribe(params => {
      let clienteId = +params.get('clienteId');
      this.clienteService.getCliente(clienteId).subscribe(cliente => {
        this.factura.cliente = cliente;
      });
    });

    this.productosFiltrados = this.autocompleteControl.valueChanges.pipe(
      startWith(''),
      map(value => this._filter(value || '')),
    );
  }


  private _filter(value: string): string[] {
    const filterValue = value.toLowerCase();

    return this.productos.filter(option => option.toLowerCase().includes(filterValue));
  }

}
