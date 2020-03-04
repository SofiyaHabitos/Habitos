angular.module('myApp',['mwl.calendar', 'ngAnimate', 'ui.bootstrap','colorpicker.module']);
    angular.module('myApp')
    .controller('DraggableExternalEventsCtrl', function(moment, calendarConfig,$http,$scope,$log,$rootScope,$filter) {
   
      $scope.mealtime_name="<%= params[:meal_time] %>"
      var vm = this;
      vm.data = [];
      vm.events=[];
      $scope.dataLoaded = false; 
      
      $http.get('http://api.texparts.in:81/api/v1/menu_masters')
      .then(function(response){
        angular.forEach(response.data,function(value){
          if(value.allery=="" || value.allery==null){      
            $scope.allery ==null;       
          }
          else{
            $scope.allery=value.allery.name;
          }
          if(value.meal_restriction=="" || value.meal_restriction==null){
            $scope.meal_restriction=null;
          }
          else{
            $scope.meal_restriction=value.meal_restriction.meal_restriction_name;
          }
          vm.data.push({
            "title":value.menu_master_name,
            "type": 'warning',
            "color": calendarConfig.colorTypes.warning,
            "draggable": false,
            "category":value.category.id,
            "menu_master_id":value.id,
            "category_name":value.category.category_name,
            "food_category":value.food_category.name,
            "meal_restriction":$scope.meal_restriction,
            "alergy":$scope.allery,
            "menu_items":value.menu_production_items
          });
        });
        $scope.dataLoaded = true;
      })

      $http.get('http://api.texparts.in:81/api/v1/all_tenants').then(function(tenant){
        $scope.GetTenants=tenant.data;
      })

      vm.externalEvents =vm.data;
      vm.calendarView = 'month';
      vm.viewDate = moment().startOf('month').toDate();
      vm.cellIsOpen = false;
      vm.dateStart="<%= params[:from_date] %>"
      vm.dateEnd="<%= params[:to_date] %>"
      vm.dateStart=$filter('date')(vm.dateStart, "yyyy-MM-dd");
      vm.dateEnd=$filter('date')(vm.dateEnd, "yyyy-MM-dd");
    
      vm.eventTimesChanged = function(event,start,end,dateStart,dateEnd) {
        var dateoption=false;
        if(vm.events.length > 0){
          for(var i in vm.events){
            var existdate=$filter('date')(vm.events[i].startsAt, "yyyy-MM-dd");
            var newchdate=$filter('date')(start, "yyyy-MM-dd");
            if(existdate == newchdate){
              dateoption=true;
              $scope.comboname=vm.events[i].title
            }
          }
        }
        if(dateoption){
          alert("Already assigned "+$scope.comboname+" combo. To assign a new combo delete the existing combo first");
        }

        if(dateoption != true){
          vm.newDate=$filter('date')(new Date, "yyyy-MM-dd");
          vm.start=$filter('date')(start, "yyyy-MM-dd");
          if((vm.start >= vm.newDate && vm.dateEnd >= vm.newDate && vm.dateEnd >= vm.start)) { 
            if(event){
              event.startsAt = start;
              event.startsAt = new Date(event.startsAt);      
              var externalIndex = vm.externalEvents.indexOf(event);
              if(externalIndex > -1) {
                vm.externalEvents =vm.data;
                vm.externalEvents.splice(externalIndex, 1);
                $http.get('http://api.texparts.in:81/api/v1/menu_masters')
                .then(function(response){
                  angular.forEach(response.data,function(value){
                    if(value.allery=="" || value.allery==null){      
                      $scope.allery ==null;       
                    }
                    else{
                      $scope.allery=value.allery.name;
                    }
                    if(value.meal_restriction=="" || value.meal_restriction==null){
                      $scope.meal_restriction=null;
                    }
                    else{
                      $scope.meal_restriction=value.meal_restriction.meal_restriction_name;
                    }
                    vm.data.push({
                      "title":value.menu_master_name,
                      "type": 'warning',
                      "color": calendarConfig.colorTypes.warning,
                      "draggable": false,
                      "category":value.category.id,
                      "menu_master_id":value.id,
                      "category_name":value.category.category_name,
                      "food_category":value.food_category.name,
                      "meal_restriction":$scope.meal_restriction,
                      "alergy":$scope.allery,
                      "menu_items":value.menu_production_items
                    });
                  });
                })
              vm.externalEvents =vm.data;
            }
            
            if(end){
              event.endsAt = end;
            }
            
            vm.viewDate = start;
            vm.events.push(event);
            $rootScope.dateClicked(event);
          }
          else{
            console.log('Only one events are allowed per day');
          }
        }
        else {
          $log.warn('Event was in the past');
        }
      }
    }
    $scope.CreateCalendarEvents=function(data){ 
      $scope.Alldata=[];
      for(var i in data){
        $scope.Alldata.push({
          "date": data[i].startsAt,
          "menu_master_id": data[i].menu_master_id,
          "tenant_id" : "<%= params[:tenant_id] %>",
          "category_id" : "<%= category_id %>"
        })
      }
      var CreateCalendar={
        "menu_customer" :
        $scope.Alldata
      };
      $http.post('http://api.texparts.in:81/api/v1/menu_customers',CreateCalendar)
      .then(function(CalEventResponse){
        if(CalEventResponse){
          location.href="/normalmenu_sites";
        }
      })
    }

    $rootScope.dateClicked=function(event){
      if(event == null || event == ''){
        $scope.carterdetails=null;
      }
      else{
        if(event.constructor === Array){
          $scope.DayEvents=event[0];
          $http.get('http://api.texparts.in:81/api/v1/menu_details?name='+$scope.DayEvents.title)
          .then(function(response){
            $scope.carterdetails=response.data;
          })
        }
        else{
          $scope.DayEvents=event;
          $http.get('http://api.texparts.in:81/api/v1/menu_details?name='+$scope.DayEvents.title).then(function(response){
            $scope.carterdetails=response.data;
          })
        }
      }
    }
 
    $scope.check=function(Day){
      var eventIndex=vm.events.indexOf(Day[0]);
      vm.events.splice(eventIndex,1)
      vm.externalEvents.push(Day);
      $scope.DayEvents='';
    }

    vm.viewChangeClicked = function(nextView) {
      if (nextView === 'day') {
        return false;
      }
    };

})// controller closed

.filter('unique', function() {
  return function (arr, field) {
    var o = {}, i, l = arr.length, r = [];
    for(i=0; i<l;i+=1) {
      o[arr[i][field]] = arr[i];
    }
    for(i in o) {
      r.push(o[i]);
    }
    return r;
  };
});