import { Injectable } from '@angular/core';
import {environment} from "../../environments/environment";
import {BehaviorSubject} from "rxjs";
import {GoogleLoginProvider, SocialUser} from "angularx-social-login";
import {AuthService} from "angular-6-social-login";
import {HttpClient} from "@angular/common/http";
import {dashCaseToCamelCase} from "@angular/compiler/src/util";

@Injectable({
  providedIn: 'root'
})
export class UserService {
  auth = false;
  private Server_Url = environment.serverURL;
  private user;
  authState$: BehaviorSubject<boolean> = new BehaviorSubject<boolean>(this.auth);
  userData$ = new BehaviorSubject<SocialUser | ResponseModel | object>(null);

  constructor(private authService: AuthService,
              private httpClient: HttpClient) {

    authService.authState.subscribe((user  ) =>{
      if (user !== null){
        this.auth = true;
        this.authState$.next(this.auth);
        this.userData$.next(user);
      }
    });

  }
  loginUser(email: string, password: string){
    this.httpClient.post(`${this.Server_Url}/auth/login`, {email, password})
      .subscribe((data: ResponseModel) =>{
        this.auth = data.auth;
        this.authState$.next(this.auth);
        this.userData$.next(data);
      });
  }

  googleLogin() {
    this.authService.signIn(GoogleLoginProvider.PROVIDER_ID);
  }

  logout(){
    this.authService.signOut();
    this.auth = false;
    this.authState$.next(this.auth);
  }
}

interface ResponseModel {
  token: string;
  auth: boolean;
  email: string;
  username: string;
  firstname: string;
  lastname: string;
  photoUrl: string;
  userId: number;
}
