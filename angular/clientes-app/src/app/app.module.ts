import { LOCALE_ID, NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { HeaderComponent } from "./core/components/header/header.component";
import { FooterComponent } from "./core/components/footer/footer.component";
import { DirectivaComponent } from './core/components/directiva/directiva.component';
import { ClientesComponent } from './core/components/clientes/clientes.component';
import { FormComponent } from './core/components/clientes/form.component';
import { PaginatorComponent } from './core/components/paginator/paginator.component';

import { ClienteService } from "./core/services/cliente.service";

import { RouterModule, Routes } from "@angular/router";
import { HTTP_INTERCEPTORS, HttpClientModule } from "@angular/common/http";
import { FormsModule } from "@angular/forms";

import { registerLocaleData } from "@angular/common";
import localeEs from '@angular/common/locales/es';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatNativeDateModule } from "@angular/material/core";
import { MatDatepickerModule } from "@angular/material/datepicker";
import { MatMomentDateModule } from "@angular/material-moment-adapter";
import { DetalleComponent } from './core/components/clientes/detalle/detalle.component';
import { LoginComponent } from './core/components/usuarios/login.component';
import { AuthGuard } from "./core/guards/auth.guard";
import { RoleGuard } from "./core/guards/role.guard";
import { TokenInterceptor } from "./core/interceptors/token.interceptor";
import { AuthInterceptor } from "./core/interceptors/auth.interceptor";

registerLocaleData(localeEs, 'es');

const routes: Routes = [
  { path: '', redirectTo: '/clientes', pathMatch: "full" },
  { path: 'directivas', component: DirectivaComponent },
  { path: 'clientes', component: ClientesComponent },
  { path: 'clientes/page/:page', component: ClientesComponent },
  { path: 'clientes/form', component: FormComponent, canActivate: [ AuthGuard, RoleGuard ], data: { role: 'ROLE_ADMIN' } },
  { path: 'clientes/form/:id', component: FormComponent, canActivate: [ AuthGuard, RoleGuard ], data: { role: 'ROLE_ADMIN' } },
  { path: 'login', component: LoginComponent },
]

@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    FooterComponent,
    DirectivaComponent,
    ClientesComponent,
    FormComponent,
    PaginatorComponent,
    DetalleComponent,
    LoginComponent,
  ],
  imports: [
    BrowserModule,
    RouterModule.forRoot(routes),
    HttpClientModule,
    FormsModule,
    BrowserAnimationsModule,
    MatDatepickerModule,
    MatNativeDateModule,
    MatMomentDateModule,
  ],
  providers: [
    ClienteService,
    { provide: LOCALE_ID, useValue: 'es' },
    { provide: HTTP_INTERCEPTORS, useClass: TokenInterceptor, multi: true },
    { provide: HTTP_INTERCEPTORS, useClass: AuthInterceptor, multi: true },
  ],
  bootstrap: [ AppComponent ]
})
export class AppModule {
}
