import { ProductoModel } from './producto.model';

export class ItemFacturaModel {
  producto: ProductoModel;
  cantidad: number = 1;
  importe: number;

  public calcularImporte(): number {
    return this.cantidad * this.producto.precio;
  }
}
