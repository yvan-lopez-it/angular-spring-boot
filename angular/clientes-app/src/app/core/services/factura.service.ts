import { Injectable } from '@angular/core';
import { Observable, catchError, throwError, map, tap } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { FacturaModel } from '../models/facturas/factura.model';
import { ProductoModel } from '../models/facturas/producto.model';

@Injectable({
  providedIn: 'root'
})
export class FacturaService {

  private urlEndpoint: string = 'http://localhost:8080/api/facturas';

  constructor(private http: HttpClient) {
  }

  getFactura(id: number): Observable<FacturaModel> {
    return this.http.get<FacturaModel>(`${ this.urlEndpoint }/${ id }`);
  }

  delete(id: number): Observable<void> {
    return this.http.delete<void>(`${ this.urlEndpoint }/${ id }`);
  }

  filtrarProductos(term: string): Observable<ProductoModel[]> {
    return this.http.get<ProductoModel[]>(`${ this.urlEndpoint }/filtrar-productos/${ term }`);
  }

  create(factura: FacturaModel): Observable<FacturaModel> {
    return this.http.post<FacturaModel>(this.urlEndpoint, factura);
  }
}
