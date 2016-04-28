import angular from 'angular';
import angularMeteor from 'angular-meteor';
import template from './top.html';

class TopCtrl {
  constructor() {

  }
}

export default angular.module('appTop', [
  angularMeteor
])
  .component('appTop', {
    templateUrl: 'imports/components/top/top.html',
    controller: TopCtrl

  });
