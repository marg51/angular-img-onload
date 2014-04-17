# Image Soft Load

![](http://i.uto.io/zM2Mz)

# Install

```
bower install https://github.com/marg51/angular-img-onload
```

add `bower_components/angular-img-onload/dist/angular-img-onload.js` to your files

Load the module via AngularJS 

```
var MyApp = angular.module('MyApp', ['uto.img-onload']);
```

Each `<img>` with the attribute **`ng-src`** will be affected.

### Classes ?

#### .img-onload

When an image is loading, the class `.img-onload` is added **to the parent**. 

When the image is loaded, that class is removed.

#### .img-onload-error

If an error, like a 404 error, the class `.img-onload-error` is added **to the parent** (`.img-onload` is still set)

### Add your css

examples of css

#### Easy solution

```css
img {
	display: inline;
}
div.img-onload img,
div.img-onload-error img {
	display: none;
}
```

#### Transition

```css
img {
	transition: all 0.3s ease-in;
	-webkit-transition: all 0.3s ease-in;
	opacity: 1;
}
div.img-onload img,
div.img-onload-error img {
	opacity: 0;
}
```

# License 

MIT


