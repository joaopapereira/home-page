import {Component} from 'angular2/core';
import {Router, RouteConfig, ROUTER_DIRECTIVES} from 'angular2/router'

import {HomeComponent} from '../home/home.component'
import {MenuComponent} from '../menu/menu.component'

@RouteConfig([
    {path: '/', component: HomeComponent, as: 'Home', useAsDefault: true},
])
@Component({
    selector: 'website-app',
    templateUrl: './app.component.html',
    //directives: [ROUTER_DIRECTIVES]
})
export class AppComponent {

    constructor(){
        console.log("We are up and running!");
    }

}
