import { Component, OnInit  } from '@angular/core';
import { BasComponent } from '../bas/bas.component';
import { HautComponent } from '../haut/haut.component';

@Component({
  selector: 'app-accueil',
  //imports: [BasComponent, HautComponent],
  templateUrl: './accueil.component.html',
  styleUrls: ['./accueil.component.css']
})
export class AccueilComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }

}

/*

import { Component, OnInit } from '@angular/core';
import { BasComponent } from '../bas/bas.component';
import { HautComponent } from '../haut/haut.component';

@Component({
  selector: 'app-accueil',
  templateUrl: './accueil.component.html',
  styleUrls: ['./accueil.component.css']
})
export class AccueilComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }

}
*/