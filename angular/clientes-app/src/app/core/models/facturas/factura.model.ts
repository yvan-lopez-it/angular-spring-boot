import { ItemFacturaModel } from './item-factura.model';
import { ClienteModel } from '../cliente.model';

export class FacturaModel {

  id: number;
  descripcion: string;
  observacion: string;
  items: Array<ItemFacturaModel> = [];
  cliente: ClienteModel;
  total: number;
  createdAt: string;
}
