import {Component, OnInit} from 'angular2/core';

@Component({
    selector: 'home',
    styles: [`.header {
      background-image: url('images/bg-intro.png');
      background-repeat: none;
      background-attachment: scroll;
      background-position: center center;
      -webkit-background-size: cover;
      -moz-background-size: cover;
      background-size: cover;
      -o-background-size: cover;
      text-align: center;
      color: white;
    }
    .header .intro-text {
      padding-top: 100px;
      padding-bottom: 50px;
    }
    .header .intro-text .intro-lead-in {
      font-family: "Droid Serif", "Helvetica Neue", Helvetica, Arial, sans-serif;
      font-style: italic;
      font-size: 22px;
      line-height: 22px;
      margin-bottom: 25px;
    }
    .header .intro-text .intro-heading {
      font-family: "Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;
      text-transform: uppercase;
      font-weight: 700;
      font-size: 50px;
      line-height: 50px;
      margin-bottom: 25px;
    }
    @media (min-width: 768px) {
      .header .intro-text {
        padding-top: 300px;
        padding-bottom: 200px;
      }
      .header .intro-text .intro-lead-in {
        font-family: "Droid Serif", "Helvetica Neue", Helvetica, Arial, sans-serif;
        font-style: italic;
        font-size: 40px;
        line-height: 40px;
        margin-bottom: 25px;
      }
      .header .intro-text .intro-heading {
        font-family: "Montserrat", "Helvetica Neue", Helvetica, Arial, sans-serif;
        text-transform: uppercase;
        font-weight: 700;
        font-size: 75px;
        line-height: 75px;
        margin-bottom: 50px;
      }
    }`],
    templateUrl: 'app/components/home/home.component.html'
})

export class HomeComponent implements OnInit {

    constructor() { }

    ngOnInit() { }
}
