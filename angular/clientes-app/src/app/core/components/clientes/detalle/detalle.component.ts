import { Component, Input, OnInit } from '@angular/core';
import { ClienteModel } from "../../../models/cliente.model";
import { ClienteService } from "../../../services/cliente.service";
import swal from "sweetalert2";
import { HttpEventType } from "@angular/common/http";
import { ModalService } from "../../../services/modal.service";

@Component({
  selector: 'detalle-cliente',
  templateUrl: './detalle.component.html',
  styleUrls: [ './detalle.component.css' ]
})
export class DetalleComponent implements OnInit {
  @Input() cliente: ClienteModel;
  titulo: string = "Detalle del cliente";
  fotoSeleccionada: File;
  progreso: number = 0;

  constructor(private clienteService: ClienteService,
              public modalService: ModalService,) {
  }

  ngOnInit(): void {

  }

  seleccionarFoto(event) {
    this.fotoSeleccionada = event.target.files[0];
    this.progreso = 0;
    console.log(this.fotoSeleccionada);
    if (this.fotoSeleccionada.type.indexOf('image') < 0) {
      swal.fire('Error al seleccionar imagen: ', 'El archivo debe seleccionar una foto', 'error');
      this.fotoSeleccionada = null;
    }
  }

  subirFoto() {
    if (!this.fotoSeleccionada) {
      swal.fire('Error Upload: ', 'Debe seleccionar una foto', 'error')
    } else {
      this.clienteService.subirFoto(this.fotoSeleccionada, this.cliente.id)
        .subscribe(event => {
          if (event.type === HttpEventType.UploadProgress) {
            this.progreso = Math.round((event.loaded / event.total) * 100);
          } else if (event.type === HttpEventType.Response) {
            let response: any = event.body;
            this.cliente = response.cliente as ClienteModel;

            this.modalService.notificarUpload.emit(this.cliente);

            swal.fire('La foto se ha subido completamente!', response.mensaje, "success");
          }
        });
    }
  }

  cerrarModal() {
    this.modalService.cerrarModal();
    this.fotoSeleccionada = null;
    this.progreso = 0;
  }
}
