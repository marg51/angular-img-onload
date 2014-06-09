app = angular.module('uto.img-onload')

app.directive 'ngSrc', (imgOnload) ->
	link: (scope, elm, attrs) ->
		parent = elm.parent()
		parent.addClass('img-onload')

		# Sometimes we know the src won't change. Should be optional.  
		attrs.$observe 'src', ->
			parent.addClass('img-onload')
			parent.removeClass('img-onload-error')

		
		elm.bind 'load', ->
			parent.removeClass('img-onload img-onload-error')

		elm.bind 'error', ->
			parent.addClass('img-onload-error')
			if imgOnload.onErrorSrc and elm[0].src isnt imgOnload.onErrorSrc  
				elm[0].src = imgOnload.onErrorSrc

