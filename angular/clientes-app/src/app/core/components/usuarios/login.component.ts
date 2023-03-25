import { Component, OnInit } from '@angular/core';
import { Usuario } from "../../models/usuario";
import swal from 'sweetalert2';
import { AuthService } from "../../services/auth.service";
import { Router } from "@angular/router";

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
})
export class LoginComponent implements OnInit {

  titulo: string = 'Por favor inicia sesión!';
  usuario: Usuario;

  constructor(private authService: AuthService, private router: Router) {
    this.usuario = new Usuario();
  }

  ngOnInit(): void {
    if (this.authService.isAuthenticated()) {
      swal.fire('Login', `Hola ${ this.authService.usuario.username } ya estás autenticado!`, 'info');
      this.router.navigate([ '/clientes' ]);
    }
  }

  login(): void {
    console.log(this.usuario);
    if (this.usuario.username == null || this.usuario.password == null) {
      swal.fire('Error Login', 'Username o password vacías!', 'error');
      return;
    }
    this.authService.login(this.usuario).subscribe({
      next: response => {
        console.log(response);
        this.authService.guardarUsuario(response.access_token);
        this.authService.guardarToken(response.access_token);

        let usuario = this.authService.usuario;

        this.router.navigate([ '/clientes' ]);
        swal.fire('Login', `Hola ${ usuario.username }, has iniciado sesión con exito`, 'success');
      }, error: err => {
        if (err.status == 400) {
          swal.fire('Error Login', 'Usuario o clave incorrecta.', 'error');
        }
      }
    });
  }

}
