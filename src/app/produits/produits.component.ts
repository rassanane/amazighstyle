import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ProduitsService } from '../produits.service';
import { Produit } from '../produit';

@Component({
  selector: 'app-produits',
  templateUrl: './produits.component.html',
  styleUrls: ['./produits.component.css']
})
export class ProduitsComponent implements OnInit {

  constructor(private restService : ProduitsService,
    private route : ActivatedRoute,
    private router : Router
  ) { }

  idFamille!: Number;
  idType!: Number;

  listProduits!: Produit[];

  messageError = ""; 

  ngOnInit(): void {

    this.route.queryParamMap.subscribe(params => {
      this.idFamille = Number(params.get('idFamille')) || 1;
      console.log("this.idFamille : " + this.idFamille);
    });

    /*this.route.params.subscribe(params => {
      this.idFamille = params['idFamille'] ?? 1;
      console.log("this.idFamille : " + this.idFamille);
   });*/

   this.restService.getProduitParFamille(Number(this.idFamille)).subscribe({
     next: (result: any) => {
       this.listProduits = result;
       console.log(result);
     },
     error: (err: any) => {
       this.messageError = "Erreur technique coté serveur !";
       console.log("Erreur technique : '"+err.error+"' !");
     },
     complete: () => {
       console.log('complete');
     }
     });

  }
  
  afficherProduits(idFamille:Number, idType:Number){

    console.log("idType : " + idType);
    this.idType = idType;

    this.restService.getProduitParType(Number(idType)).subscribe({
      next: (result: any) => {
        this.listProduits = result;
        console.log(result);
      },
      error: (err: any) => {
        this.messageError = "Erreur technique coté serveur !";
        console.log("Erreur technique : '"+err.error+"' !");
      },
      complete: () => {
        console.log('complete');
      }
      });

    /*this.router.navigate(['/produits'], { queryParams: { idFamille : idFamille } })
    .then(() => {
      window.location.reload();
    });*/

  }

}

