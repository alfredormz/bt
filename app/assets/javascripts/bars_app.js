var app = angular.module('bars', ['ngRoute', 'templates']);

app.config([
    "$routeProvider",
    function($routeProvider){
		$routeProvider
			.when("/", {
				controller: "BarSearchController",
				templateUrl: "bar_search.html"
			})
			.when("/:id", {
				controller: "BarDetailController",
				templateUrl: "bar_detail.html"
			});
    }
]);

app.controller("BarSearchController", [
    "$scope", "$http", "$location",
    function($scope, $http, $location) {
      $scope.search = function(searchTerm) {
        if(searchTerm.length < 3) {
          return;
        }
        $http.get("/bars.json",
            {"params": {"q[name_or_address_or_categories_or_snippet_text_or_neighborhoods_cont]": searchTerm} } 
        ).then(function(response){
          $scope.bars = response.data;
        }, function(response){
            console.log("There was a problem: " + response.status);
          }
        );
      }

		 $scope.viewDetails = function(bar) {
			 $location.path("/" + bar.id);
		 }
    }
]);

app.controller("BarDetailController", [
	"$scope", "$http", "$routeParams",
	function($scope, $http, $routeParams) {
		var barId = $routeParams.id;
	  console.log(barId);
		$scope.bar = {};

		$http.get(
			"/bars/" + barId + ".json"
	 ).then(function(response){
			$scope.bar = response.data;
	 }, function(response){
		  console.log("Error!");
	});

	}
]);
