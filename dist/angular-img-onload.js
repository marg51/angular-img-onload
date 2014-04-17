(function() {
  var app;

  app = angular.module('uto.img-onload', []);

  app.directive('ngSrc', function() {
    return {
      link: function(scope, elm, attrs) {
        var parent;
        parent = elm.parent();
        parent.addClass('img-onload');
        attrs.$observe('src', function() {
          parent.addClass('img-onload');
          return parent.removeClass('img-onload-error');
        });
        elm.bind('load', function() {
          return parent.removeClass('img-onload img-onload-error');
        });
        return elm.bind('error', function() {
          console.log('error');
          parent.removeClass('img-onload');
          return parent.addClass('img-onload-error');
        });
      }
    };
  });

}).call(this);
