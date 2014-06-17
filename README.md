# Image Soft Load

[See the DEMO](http://img-onload.uto.io/index.html)

Animate your freshly loaded images or replace them if the image is not found !

<table>
	<thead>
		<tr>
			<th>while loading</th>
			<th>When image not found</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td><img src="http://i.uto.io/TcxOT"/></td>
			<td><img src="http://i.uto.io/TcxOT"/></td>
		</tr>
	</tbody>
</table>


### Classes

**angular-img-onload** add classes, describing the state of the image.

<table>
	<thead>
		<tr>
			<th>class</th>
			<th>DOM target</th>
			<th>description</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>`.img-onload`</td>
			<td>img's parent</td>
			<td>Added when the image is loading, then removed when successfully loaded</td>
		</tr>
		<tr>
			<td>`.img-onload-error`</td>
			<td>img's parent</td>
			<td>Added when an error (i.e. 404) occured</td>
		</tr>
	</tbody>
</table>



### Install

```
bower install https://github.com/marg51/angular-img-onload.git#0.0.2
```

add `bower_components/angular-img-onload/dist/angular-img-onload.js` to your files

Load the module via AngularJS 

```
var MyApp = angular.module('MyApp', ['uto.img-onload']);
```

Each `<img>` with the attribute **`ng-src`** will be affected.

### Replace a broken image

```javascript
	app.config(function(imgOnloadProvider) {
    	imgOnloadProvider.setImage("http://path/to/new/image");
	});
```



### Add your own css

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

### Run the demo 

```
npm install
bower install
grunt
```

and go to `/public/index.html`

# License 

MIT


