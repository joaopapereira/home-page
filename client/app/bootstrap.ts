/// <reference path="../../node_modules/angular2/typings/browser.d.ts" />

import {bootstrap}    from 'angular2/platform/browser'
import {provide}    from 'angular2/core'
import {CORE_DIRECTIVES} from 'angular2/common'
import {ROUTER_PROVIDERS} from 'angular2/router'

import {AppComponent} from './components/app/app.component'

bootstrap(AppComponent, [
    ROUTER_PROVIDERS
]);
