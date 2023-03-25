import { Component, OnInit } from '@angular/core';
import { ClienteModel } from "../../models/cliente.model";

import { ClienteService } from "../../services/cliente.service";
import Swal from "sweetalert2";
import { tap } from "rxjs";
import { ActivatedRoute } from "@angular/router";
import { ModalService } from "../../services/modal.service";
import { AuthService } from "../../services/auth.service";

@Component({
  selector: 'app-clientes',
  templateUrl: './clientes.component.html',
})
export class ClientesComponent implements OnInit {

  clientes: ClienteModel[];
  paginador: any;
  clienteSeleccionado: ClienteModel;

  constructor(private clienteService: ClienteService,
              private modalService: ModalService,
              public authService: AuthService,
              private activatedRoute: ActivatedRoute) {
  }

  ngOnInit(): void {

    this.activatedRoute.paramMap
      .subscribe(params => {
          let page = +params.get('page');
          if (!page) {
            page = 0;
          }
          this.clienteService.getClientes(page).pipe(
            //tap(clientes => this.clientes = clientes)
            tap(response => {
              console.log("ClientesComponent: tap 3");
              (response.content as ClienteModel[]).forEach(cliente => console.log(cliente.nombre));
            })
          ).subscribe(response => {
            this.clientes = response.content as ClienteModel[];
            this.paginador = response;
          }); //subscribe();
        }
      );

    this.modalService.notificarUpload.subscribe(cliente => {
      this.clientes = this.clientes.map(clienteOriginal => {
        if (cliente.id == clienteOriginal.id) {
          clienteOriginal.foto = cliente.foto;
        }
        return clienteOriginal;
      })
    });

  }

  delete(cliente: ClienteModel): void {
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
              '¡ClienteModel eliminado!',
              `Cliente ${ cliente.nombre } eliminado con éxito`,
              'success'
            )
          }
        );
      }
    })
  }

  abrirModal(cliente: ClienteModel) {
    this.clienteSeleccionado = cliente;
    this.modalService.abrirModal();
  }

}
