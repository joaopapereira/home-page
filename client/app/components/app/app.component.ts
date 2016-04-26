import {Component} from 'angular2/core';
import {Router, RouteConfig, ROUTER_DIRECTIVES} from 'angular2/router'

import {HomeComponent} from '../home/home.component'
import {MenuComponent} from '../menu/menu.component'
import {AboutComponent} from '../about/about.component'
import {PortfolioComponent} from '../portfolio/portfolio.component'

@RouteConfig([
    {path: '/', component: HomeComponent, as: 'Home', useAsDefault: true},
    {path: '/about', component: AboutComponent, as: 'About'},
    {path: '/portfolio', component: PortfolioComponent, as: 'Portfolio'},
])
@Component({
    selector: 'website-app',
    templateUrl: 'app/components/app/app.component.html',
    directives: [ROUTER_DIRECTIVES, MenuComponent],
})
export class AppComponent {

    constructor(){
        console.log("We are up and running!");
    }

}
