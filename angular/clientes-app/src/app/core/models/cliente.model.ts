import { RegionModel } from "./region.model";
import { FacturaModel } from "./facturas/factura.model";

export class ClienteModel {
  id: number;
  nombre: string;
  apellido: string;
  createdAt: string;
  email: string;
  foto: string;
  region: RegionModel;
  facturas: Array<FacturaModel> = [];
}
