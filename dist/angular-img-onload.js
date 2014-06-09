(function() {
  var app;

  app = angular.module('uto.img-onload', []);

}).call(this);

(function() {
  var app;

  app = angular.module('uto.img-onload');

  app.directive('ngSrc', function(imgOnload) {
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
          parent.addClass('img-onload-error');
          if (imgOnload.onErrorSrc && elm[0].src !== imgOnload.onErrorSrc) {
            return elm[0].src = imgOnload.onErrorSrc;
          }
        });
      }
    };
  });

}).call(this);

(function() {
  var app;

  app = angular.module('uto.img-onload');

  app.provider('imgOnload', function() {
    var $provider;
    $provider = {};
    $provider.setImage = function(image) {
      return $provider.onErrorSrc = image;
    };
    $provider.$get = function() {
      return {
        onErrorSrc: $provider.onErrorSrc
      };
    };
    return $provider;
  });

}).call(this);
