app = angular.module('uto.img-onload')

app.provider 'imgOnload', ->
	$provider = {}

	$provider.setImage = (image) ->
		$provider.onErrorSrc = image

	$provider.$get = ->
		return {
			onErrorSrc: $provider.onErrorSrc
		}

	return $provider