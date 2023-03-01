import { Component, OnInit } from '@angular/core';
import { Cliente } from "./cliente";

import { ClienteService } from "./cliente.service";
import Swal from "sweetalert2";
import { tap } from "rxjs";

@Component({
  selector: 'app-clientes',
  templateUrl: './clientes.component.html',
})
export class ClientesComponent implements OnInit {

  clientes: Cliente[];

  constructor(private clienteService: ClienteService) {
  }

  ngOnInit(): void {
    this.clienteService.getClientes().pipe(
      //tap(clientes => this.clientes = clientes)
      tap(clientes => {
        console.log("ClientesComponent: tap 3");
        clientes.forEach(cliente => console.log(cliente.nombre));
      })
    ).subscribe(clientes => this.clientes = clientes); //subscribe();
  }

  delete(cliente: Cliente): void {
    const swalWithBootstrapButtons = Swal.mixin({
      customClass: {
        confirmButton: 'btn btn-success',
        cancelButton: 'btn btn-danger'
      },
      buttonsStyling: false
    })

    swalWithBootstrapButtons.fire({
      title: '¿Estás seguro?',
      text: `¿Está seguro que desea eliminar  al cliente ${ cliente.nombre } ${ cliente.apellido }?`,
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: '¡Sí, eliminar!',
      cancelButtonText: '¡No, cancelar!',
      reverseButtons: true
    }).then((result) => {
      if (result.isConfirmed) {
        this.clienteService.delete(cliente.id).subscribe(
          response => {
            this.clientes = this.clientes.filter(cli => cli != cliente);
            swalWithBootstrapButtons.fire(
              '¡Cliente eliminado!',
              `Cliente ${ cliente.nombre } eliminado con éxito`,
              'success'
            )
          }
        );
      }
    })
  }


}
