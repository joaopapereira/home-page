import {Component, OnInit} from 'angular2/core';
import { RouteConfig, RouterLink, RouterOutlet } from 'angular2/router';
@Component({
    selector: 'page-menu',
    templateUrl: 'app/components/menu/menu.component.html',
    styles: [`.navbar-default {
      background-color: #222222;
      border-color: transparent;
    }
    .navbar-default .navbar-brand {
      color: #ee7335;
      font-family: "Kaushan Script", "Helvetica Neue", Helvetica, Arial, cursive;
    }
    .navbar-default .navbar-brand:hover,
    .navbar-default .navbar-brand:focus,
    .navbar-default .navbar-brand:active,
    .navbar-default .navbar-brand.active {
      color: #dd5713;
    }
    .navbar-default .navbar-collapse {
      border-color: rgba(255, 255, 255, 0.02);
    }
    .navbar-default .navbar-toggle {
      background-color: #ee7335;
      border-color: #ee7335;
    }
    .navbar-default .navbar-toggle .icon-bar {
      background-color: white;
    }
    .navbar-default .navbar-toggle:hover,
    .navbar-default .navbar-toggle:focus {
      background-color: #ee7335;
    }
    .navbar-default .nav li a {
      font-family: "Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;
      text-transform: uppercase;
      font-weight: 400;
      letter-spacing: 1px;
      color: white;
    }
    .navbar-default .nav li a:hover,
    .navbar-default .nav li a:focus {
      color: #ee7335;
      outline: none;
    }
    .navbar-default .navbar-nav > .active > a {
      border-radius: 0;
      color: white;
      background-color: #ee7335;
    }
    .navbar-default .navbar-nav > .active > a:hover,
    .navbar-default .navbar-nav > .active > a:focus {
      color: white;
      background-color: #dd5713;
    }
    @media (min-width: 768px) {
      .navbar-default {
        background-color: transparent;
        padding: 25px 0;
        -webkit-transition: padding 0.3s;
        -moz-transition: padding 0.3s;
        transition: padding 0.3s;
        border: none;
      }
      .navbar-default .navbar-brand {
        font-size: 2em;
        -webkit-transition: all 0.3s;
        -moz-transition: all 0.3s;
        transition: all 0.3s;
      }
      .navbar-default .navbar-nav > .active > a {
        border-radius: 3px;
      }
      .navbar-default .navbar-shrink {
        background-color: #222222;
        padding: 10px 0;
      }
      .navbar-default .navbar-shrink .navbar-brand {
        font-size: 1.5em;
      }
    }
    `],
    directives: [RouterLink, RouterOutlet]
})
export class MenuComponent  implements OnInit {

    constructor() { }

    ngOnInit() { }
}
