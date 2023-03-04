import { RegionModel } from "./region.model";

export class ClienteModel {
  id: number;
  nombre: string;
  apellido: string;
  createdAt: string;
  email: string;
  foto: string;
  region: RegionModel;
}
