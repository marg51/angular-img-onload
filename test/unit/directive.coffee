describe 'uto.img-onload -', ->
	element = parent = $scope = undefined

	beforeEach module('uto.img-onload')

	beforeEach inject ($compile, $rootScope, $httpBackend) ->
		$scope = $rootScope
		parent = angular.element('<div/>')
		element = $compile(angular.element('<img ng-src="{{file}}"/>'))($rootScope)
		parent.append element

	describe 'pass', ->
		it 'pass', ->
			dump 'There is no test'
			expect(true).toBe true
			
	###
		@todo create tests
	###
		
