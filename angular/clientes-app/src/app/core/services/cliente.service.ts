import { Injectable } from '@angular/core';
import { formatDate, DatePipe } from "@angular/common";
import { ClienteModel } from "../models/cliente.model";
import { Observable, catchError, throwError, map, tap } from "rxjs";
import { HttpClient, HttpEvent, HttpHeaders, HttpRequest } from "@angular/common/http";
import swal from "sweetalert2";
import { Router } from "@angular/router";
import { RegionModel } from "../models/region.model";


@Injectable({
  providedIn: 'root'
})
export class ClienteService {

  private urlEndPoint: string = 'http://localhost:8080/api/clientes';
  private httpHeaders: HttpHeaders = new HttpHeaders({ 'Content-Type': 'application/json' });

  constructor(private http: HttpClient, private router: Router) {
  }

  getRegiones(): Observable<RegionModel[]> {
    return this.http.get<RegionModel[]>(this.urlEndPoint + '/regiones');
  }

  getClientes(page: number): Observable<any> {
    return this.http.get(this.urlEndPoint + '/page/' + page)
      .pipe(
        tap(
          (response: any) => {
            console.log("ClienteService: tap 1");
            (response.content as ClienteModel[]).forEach(cliente => console.log(cliente.nombre));
          }),
        map((response: any) => {
          (response.content as ClienteModel[]).map(cliente => {
            cliente.nombre = cliente.nombre.toUpperCase();

            //cliente.createdAt = formatDate(cliente.createdAt, 'dd-MM-yyyy', 'en-US');


            let datePipe = new DatePipe('es');
            //cliente.createdAt = datePipe.transform(cliente.createdAt, 'dd/MM/yyyy');
            //cliente.createdAt = datePipe.transform(cliente.createdAt, 'EEE. dd, MMM yyyy');
            //cliente.createdAt = datePipe.transform(cliente.createdAt, 'fullDate');

            return cliente;
          });
          return response;
        }),
        tap((response: any) => {
          console.log("ClienteService: tap 2");
          (response.content as ClienteModel[]).forEach(cliente => console.log(cliente.nombre));
        }),
      );
  }

  create(cliente: ClienteModel): Observable<ClienteModel> {
    return this.http.post(this.urlEndPoint, cliente, { headers: this.httpHeaders }).pipe(
      map((response: any) => response.cliente as ClienteModel),
      catchError(e => {
        if (e.status == 400) {
          return throwError(() => e);
        }
        console.error(e.error.mensaje);
        swal.fire(e.error.mensaje, e.error.error, 'error');
        return throwError(() => e);
      })
    );
  }

  getCliente(id): Observable<ClienteModel> {
    return this.http.get<ClienteModel>(`${ this.urlEndPoint }/${ id }`)
      .pipe(
        catchError(e => {
          this.router.navigate([ '/clientes' ]);
          console.error(e.error.mensaje);
          swal.fire('Error al editar', e.error.mensaje, 'error');
          return throwError(() => e);
        })
      );
  }

  update(cliente: ClienteModel): Observable<any> {
    return this.http.put<any>(`${ this.urlEndPoint }/${ cliente.id }`, cliente, { headers: this.httpHeaders })
      .pipe(
        catchError(e => {
          if (e.status == 400) {
            return throwError(() => e);
          }
          console.error(e.error.mensaje);
          swal.fire(e.error.mensaje, e.error.error, 'error');
          return throwError(() => e);
        })
      );
  }

  delete(id: number): Observable<ClienteModel> {
    return this.http.delete<ClienteModel>(`${ this.urlEndPoint }/${ id }`, { headers: this.httpHeaders })
      .pipe(
        catchError(e => {
          console.error(e.error.mensaje);
          swal.fire(e.error.mensaje, e.error.error, 'error');
          return throwError(() => e);
        })
      );
  }

  subirFoto(archivo: File, id): Observable<HttpEvent<{}>> {

    let formData = new FormData();
    formData.append("archivo", archivo);
    formData.append("id", id);

    const req = new HttpRequest('POST', `${ this.urlEndPoint }/upload`, formData, {
      reportProgress: true
    });

    return this.http.request(req);

    //return this.http.post(`${this.urlEndPoint}/upload`, formData)
    // .pipe(
    //     map((response: any) => response.cliente as ClienteModel),
    //     catchError(e => {
    //       console.error(e.error.mensaje);
    //       swal.fire(e.error.mensaje, e.error.error, 'error');
    //       return throwError(() => e);
    //     })
    //   );

  }

}
