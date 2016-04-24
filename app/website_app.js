var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") return Reflect.decorate(decorators, target, key, desc);
    switch (arguments.length) {
        case 2: return decorators.reduceRight(function(o, d) { return (d && d(o)) || o; }, target);
        case 3: return decorators.reduceRight(function(o, d) { return (d && d(target, key)), void 0; }, void 0);
        case 4: return decorators.reduceRight(function(o, d) { return (d && d(target, key, o)) || o; }, desc);
    }
};
var core_1 = require('angular2/core');
var WebsiteApp = (function () {
    function WebsiteApp() {
    }
    WebsiteApp = __decorate([
        core_1.Component({
            // Declare the tag name in index.html to where the component attaches
            selector: 'website-app',
            // Location of the template for this component
            templateUrl: 'templates/home.html'
        })
    ], WebsiteApp);
    return WebsiteApp;
})();
exports.WebsiteApp = WebsiteApp;
