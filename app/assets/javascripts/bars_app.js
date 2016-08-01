var app = angular.module('bars', []);

app.controller("BarSearchController", [
    "$scope", "$http",
    function($scope, $http) {
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
    }
]);
