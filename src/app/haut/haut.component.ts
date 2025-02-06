import { Component, OnInit, inject } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-haut',
  templateUrl: './haut.component.html',
  styleUrls: ['./haut.component.css']
})
export class HautComponent implements OnInit {

  constructor(private router: Router) {}

  ngOnInit(): void {

  }

  afficherProduits(id:Number){

    /*this.router.navigate(
      ['/produits'],
      { queryParams: { idFamille : id } }
    );*/

    this.router.navigate(['/produits'], { queryParams: { idFamille : id } })
    .then(() => {
      window.location.reload();
    });

  }

}
