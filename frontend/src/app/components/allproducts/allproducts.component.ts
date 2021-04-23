import { Component, OnInit } from '@angular/core';
import {ProductService} from '../../services/product.service';
import {Subscription} from 'rxjs';
import { Router } from '@angular/router';
@Component({
  selector: 'mg-allproducts',
  templateUrl: './allproducts.component.html',
  styleUrls: ['./allproducts.component.scss']
})
export class AllproductsComponent implements OnInit {

  products: any[] = [];
  subs: Subscription[] = [];
  errorMessage: string;
  hasError = false;
  success = false;

  constructor(private productService: ProductService,
              private router: Router) {
  }

  ngOnInit(): void {
    this.hasError = false;
    this.subs.push(this.productService.getAllProducts().subscribe((prods: any) => {
      this.products = prods.products;
    }));
  }

  // ngOnDestroy(): void {
  //   this.subs.map(s => s.unsubscribe());
  // }
  selectProduct(id: number) {
    this.router.navigate(['/product', id]).then();
  }

}
