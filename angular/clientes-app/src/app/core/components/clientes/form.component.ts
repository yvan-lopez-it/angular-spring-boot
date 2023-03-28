import { Component, OnInit } from '@angular/core';
import { ClienteModel } from '../../models/cliente.model';
import { ClienteService } from '../../services/cliente.service';
import { Router, ActivatedRoute } from '@angular/router';
import swal from 'sweetalert2';
import { RegionModel } from '../../models/region.model';

@Component({
  selector: 'app-form',
  templateUrl: './form.component.html',
})
export class FormComponent implements OnInit {

  public cliente: ClienteModel = new ClienteModel();
  public titulo: string = 'Crear cliente';
  regiones: RegionModel[];
  public errores: string[];

  constructor(private clienteService: ClienteService,
              private router: Router,
              private activateRoute: ActivatedRoute,) {
  }

  ngOnInit(): void {
    this.cargarCliente();
    this.clienteService.getRegiones().subscribe(regiones => this.regiones = regiones);
  }

  cargarCliente(): void {
    this.activateRoute.params.subscribe(
      params => {
        let id = params['id'];
        if (id) {
          this.clienteService.getCliente(id).subscribe(
            cliente => this.cliente = cliente
          );
        }
      }
    );
  }

  create(): void {
    console.log(this.cliente);
    this.clienteService.create(this.cliente).subscribe({
      next: cliente => {
        this.router.navigate([ '/clientes' ]);
        swal.fire('Nuevo ClienteModel', `Cliente ${ cliente.nombre } ha sido creado con éxito!`, 'success');
      },
      error: err => {
        this.errores = err.error.errors as string[];
        console.error('Codigo del error desde el backend: ' + err.status);
        console.error(err.error.errors);
      }
    });
  }

  update(): void {
    console.log(this.cliente);
    this.cliente.facturas = null;
    this.clienteService.update(this.cliente).subscribe({
      next: json => {
        this.router.navigate([ '/clientes' ]);
        swal.fire('ClienteModel actualizado', `${ json.mensaje }: ${ json.cliente.nombre }`, 'success');
      },
      error: err => {
        this.errores = err.error.errors as string[];
        console.error('Codigo del error desde el backend: ' + err.status);
        console.error(err.error.errors);
      }
    });
  }

  compararRegion(o1: RegionModel, o2: RegionModel): boolean {
    if (o1 === undefined && o2 === undefined) {
      return true;
    }
    return o1 === null || o2 === null || o1 === undefined || o2 === undefined ? false : o1.id === o2.id;
  }
}
