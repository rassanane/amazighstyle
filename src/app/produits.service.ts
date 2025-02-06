import { Injectable } from '@angular/core';
import { Produit } from './produit';

import { Observable, throwError } from 'rxjs';
import { catchError, retry } from 'rxjs/operators';
import { HttpClient, HttpHeaders, HttpErrorResponse } from '@angular/common/http';
import { environment } from 'src/environments/environment';

@Injectable({
   providedIn: 'root'
})
export class ProduitsService {
  
  private produitsRestUrl = environment.produitsRestUrl;

  private httpOptions = {
      headers: new HttpHeaders( { 'Content-Type': 'application/json',
                                  //'Access-Control-Allow-Origin':'*',
                                  //'Access-Control-Allow-Headers': 'Origin, X-Requested-With, Content-Type, Accept',
                                  'Authorization': 'Basic ' + btoa('rachid:rachid123')
                                 })
  };

  private httpOptionsPdf = {
    headers: new HttpHeaders( { //'Content-Type': 'multipart/form-data',
                                //'Content-Type': 'application/file',
                                'enctype': 'multipart/form-data',
                                //'Accept': 'application/json',
                                //'responseType': 'arraybuffer',
                                //'Access-Control-Allow-Origin':'*',
                                //'Access-Control-Allow-Headers': 'Origin, X-Requested-With, Content-Type, Accept',
                                'Authorization': 'Basic ' + btoa('rachid:rachid123')
                               })
  };

  constructor(private httpClient : HttpClient) { } 

  private httpErrorHandler (error: HttpErrorResponse) {
    if (error.error instanceof ErrorEvent) {
       console.error("Erreur côté client : " + error.message);
    } else {
       console.error("Erreur côté serveur. Le code de l'erreur : "  + error.status + " et l'erreur retournée : " + error.message);
    }

    return throwError("Erreur lors de l'appel du service");
  }

  getProduitParFamille(id: number) {
    return this.httpClient.get<Produit[]>(this.produitsRestUrl + "/famille/" + id, this.httpOptions)
    .pipe(
        retry(3),
        catchError(this.httpErrorHandler)
    );
   }

   getProduitParType(id: number) {
    return this.httpClient.get<Produit[]>(this.produitsRestUrl + "/type/" + id, this.httpOptions)
    .pipe(
        retry(3),
        catchError(this.httpErrorHandler)
    );
   }

}