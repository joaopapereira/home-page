import angular from 'angular';
import angularMeteor from 'angular-meteor';
import menu from '../imports/components/menu/menu'
import top from '../imports/components/top/top'

angular.module('home-page', [
  angularMeteor,
  menu.name,
  top.name
]);
