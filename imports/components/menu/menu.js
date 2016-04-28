import angular from 'angular';
import angularMeteor from 'angular-meteor';
import template from './menu.html';

class MenuCtrl {
  constructor() {

  }
}

export default angular.module('appMenu', [
  angularMeteor
])
  .component('appMenu', {
    templateUrl: 'imports/components/menu/menu.html',
    controller: MenuCtrl

  });
