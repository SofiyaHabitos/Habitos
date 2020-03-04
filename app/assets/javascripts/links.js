$(document).ready(function () { 
  $(".fold").change(function () {
    var idd=($(this).val());
    $.ajax({
      type: "GET",
      url: "/kitchen_users/dynamic_drop."+idd
    })
  });
});

$('.confirmation').on('click', function () {
  return confirm('Are you sure?');
});

$(document).ready(function() {
  var table = $('#foodgroup').DataTable();
  $('#foodgroup tbody').on( 'click', 'tr', function () {
    if ( $(this).hasClass('selected') ) {
      $(this).removeClass('selected');
      $(".side-pop").hide();
    }
    else {
      table.$('tr.selected').removeClass('selected');
      $(this).addClass('selected');
      var id = $(this).attr('id'); 
      $(".side-pop").show();
      $("#show").attr("href","/food_groups/"+id);
      $("#destroy").attr("href","/food_groups/"+id);
      $("#edit").attr("href","/food_groups/"+id+"/edit");
    }
  }); 
});

// $(document).ready(function() {
//   var table = $('#tenant').dataTable();
//   $('#tenant tbody tr').hover(function() {
//       var id = $(this).attr('id'); 
//       $(".side-pop").show();
//       $("#show").attr("href","/tenants/"+id);
//       $("#destroy").attr("href","/tenants/"+id);
//       $("#edit").attr("href","/tenants/"+id+"/edit");
//   }); 
// });

// $(document).ready(function() {
//   var table = $('#tenant').dataTable();
//   $('#tenant tbody').on( 'click', 'tr', function () {
//     if ( $(this).hasClass('selected') ) {
//       $(this).removeClass('selected');
//       $(".side-pop").hide();
//     }
//     else {
//       table.$('tr.selected').removeClass('selected');
//       $(this).addClass('selected');
//       var id = $(this).attr('id'); 
//       $(".side-pop").show();
//       $("#show").attr("href","/tenants/"+id);
//       $("#destroy").attr("href","/tenants/"+id);
//       $("#edit").attr("href","/tenants/"+id+"/edit");
//     }
//   }); 
// });

$(document).ready(function() {
  var table = $('#menu_master').dataTable();
  $('#menu_master tbody').on( 'click', 'tr', function () {
    if ( $(this).hasClass('selected') ) {
      $(this).removeClass('selected');
      $(".side-pop").hide();
    }
    else {
      table.$('tr.selected').removeClass('selected');
      $(this).addClass('selected');
      var id = $(this).attr('id'); 
      $(".side-pop").show();
      $("#show").attr("href","/menu_masters/"+id);
      $("#destroy").attr("href","/menu_masters/"+id);
     $("#edit").attr("href","/menu_masters/"+id+"/edit");
    }
  }); 
});



$(document).ready(function() {
  var table = $('#menu_customer').dataTable();
  $('#menu_customer tbody').on( 'click', 'tr', function () {
    if ( $(this).hasClass('selected') ) {
      $(this).removeClass('selected');
      $(".side-pop").hide();
    }
    else {
      table.$('tr.selected').removeClass('selected');
      $(this).addClass('selected');
      var id = $(this).attr('id'); 
      $(".side-pop").show();
      $("#show").attr("href","/menu_customers/"+id);
      $("#destroy").attr("href","/menu_customers/"+id);
      $("#edit").attr("href","/menu_customers/"+id+"/edit");
    }
  }); 
});

// $(document).ready(function() {
//   var table = $('#category').DataTable();
//   $('#category tbody').on( 'click', 'tr', function () {
//     if ( $(this).hasClass('selected') ) {
//       $(this).removeClass('selected');
//       $(".side-pop").hide();
//     }
//     else {
//       table.$('tr.selected').removeClass('selected');
//       $(this).addClass('selected');
//       var id = $(this).attr('id'); 
//       $(".side-pop").show();
//       $("#show").attr("href","/categories/"+id);
//       $("#destroy").attr("href","/categories/"+id);
//       $("#edit").attr("href","/categories/"+id+"/edit");
//     }
//   }); 
// });

$(document).ready(function() {
  var table = $('#production_item').DataTable();
  $('#production_item tbody').on( 'click', 'tr', function () {
    if ( $(this).hasClass('selected') ) {
      $(this).removeClass('selected');
      $(".side-pop").hide();
    }
    else {
      table.$('tr.selected').removeClass('selected');
      $(this).addClass('selected');
      var id = $(this).attr('id'); 
      $(".side-pop").show();
      $("#show").attr("href","/production_items/"+id);
      $("#destroy").attr("href","/production_items/"+id);
      //$("#edit").attr("href","/production_items/"+id+"/edit");
      $("#edit").attr("href","/edit_item."+id);
    }
  }); 
});

$(document).ready(function() {
  var table = $('#nutrition').DataTable();
  $('#nutrition tbody').on( 'click', 'tr', function () {
    if ( $(this).hasClass('selected') ) {
      $(this).removeClass('selected');
      $(".side-pop").hide();
    }
    else {
      table.$('tr.selected').removeClass('selected');
      $(this).addClass('selected');
      var id = $(this).attr('id'); 
      $(".side-pop").show();
      $("#show").attr("href","/nutritions/"+id);
      $("#edit").attr("href","/nutritions/"+id+"/edit");
      $("#destroy").attr("href","/nutritions/"+id);
    }
  }); 
});

// $(document).ready(function() {
//   var table = $('#software_setup').DataTable();
//   $('#software_setup tbody').on( 'click', 'tr', function () {
//     if ( $(this).hasClass('selected') ) {
//       $(this).removeClass('selected');
//       $(".side-pop").hide();
//     }
//     else {
//       table.$('tr.selected').removeClass('selected');
//       $(this).addClass('selected');
//       var id = $(this).attr('id'); 
//       $(".side-pop").show();
//       $("#show").attr("href","/software_setups/"+id);
//       $("#destroy").attr("href","/software_setups/"+id);
//       $("#edit").attr("href","/software_setups/"+id+"/edit");
//     }
//   }); 
// });

// $(document).ready(function() {
//   var table = $('#customer_view_control').DataTable();
//   $('#customer_view_control tbody').on( 'click', 'tr', function () {
//     if ( $(this).hasClass('selected') ) {
//       $(this).removeClass('selected');
//       $(".side-pop").hide();
//     }
//     else {
//       table.$('tr.selected').removeClass('selected');
//       $(this).addClass('selected');
//       var id = $(this).attr('id'); 
//       $(".side-pop").show();
//       $("#show").attr("href","/customer_view_controls/"+id);
//       $("#destroy").attr("href","/customer_view_controls/"+id);
//       $("#edit").attr("href","/customer_view_controls/"+id+"/edit");
//     }
//   }); 
// });


// $(document).ready(function() {
//   var table = $('#point_of_sale').DataTable({"ordering": false});
//   $('#point_of_sale tbody').on( 'click', 'tr', function () {
//     if ( $(this).hasClass('selected') ) {
//       $(this).removeClass('selected');
//       $(".side-pop").hide();
//     }
//     else {
//       table.$('tr.selected').removeClass('selected');
//       $(this).addClass('selected');
//       var id = $(this).attr('id'); 
//       $(".side-pop").show();
//       $("#show").attr("href","/point_of_sales/"+id);
//       $("#destroy").attr("href","/point_of_sales/"+id);
//       $("#edit").attr("href","/point_of_sales/"+id+"/edit");
//     }
//   }); 
// });

// $(document).ready(function() {
//   var table = $('#kitchen').DataTable();
//   $('#kitchen tbody').on( 'click', 'tr', function () {
//     if ( $(this).hasClass('selected') ) {
//       $(this).removeClass('selected');
//       $(".side-pop").hide();
//     }
//     else {
//       table.$('tr.selected').removeClass('selected');
//       $(this).addClass('selected');
//       var id = $(this).attr('id'); 
//       $(".side-pop").show();
//       $("#show").attr("href","/kitchens/"+id);
//       $("#destroy").attr("href","/kitchens/"+id);
//       $("#edit").attr("href","/kitchens/"+id+"/edit");
//     }
//   }); 
// });

// $(document).ready(function() {
//   var table = $('#kitchen_user').DataTable();
//   $('#kitchen_user tbody').on( 'click', 'tr', function () {
//     if ( $(this).hasClass('selected') ) {
//       $(this).removeClass('selected');
//       $(".side-pop").hide();
//     }
//     else {
//       table.$('tr.selected').removeClass('selected');
//       $(this).addClass('selected');
//       var id = $(this).attr('id'); 
//       $(".side-pop").show();
//       $("#show").attr("href","/kitchen_users/"+id);
//       $("#destroy").attr("href","/kitchen_users/"+id);
//       $("#edit").attr("href","/kitchen_users/"+id+"/edit");
//     }
//   }); 
// });

// $(document).ready(function() {
//   var table = $('#utensil').DataTable();
//   $('#utensil tbody').on( 'click', 'tr', function () {
//     if ( $(this).hasClass('selected') ) {
//       $(this).removeClass('selected');
//       $(".side-pop").hide();
//     }
//     else {
//       table.$('tr.selected').removeClass('selected');
//       $(this).addClass('selected');
//       var id = $(this).attr('id'); 
//       $(".side-pop").show();
//       $("#show").attr("href","/utensils/"+id);
//       $("#destroy").attr("href","/utensils/"+id);
//       $("#edit").attr("href","/utensils/"+id+"/edit");
//     }
//   }); 
// });

$(document).ready(function() {
  $('#status').DataTable();
});

// $(document).ready(function() {
//   var table = $('#normal_menu').DataTable( { "bSort": false } );
//   $('#normal_menu tbody').on( 'click', 'tr', function () {
//     if ( $(this).hasClass('selected') ) {
//       $(this).removeClass('selected');
//       $(".side-pop").hide();
//     }
//     else {
//       table.$('tr.selected').removeClass('selected');
//       $(this).addClass('selected');
//       var id = $(this).attr('id'); 
//       $(".side-pop").show();
//       $("#show").attr("href","/normalmenu_sites/"+id);
//       $("#destroy").attr("href","/normalmenu_sites/"+id);
//       $("#edit").attr("href","/normalmenu_sites/"+id+"/edit");
//     }
//   }); 
// });

// $(document).ready(function() {
//   var table = $('#parent_order').DataTable();
//   $('#parent_order tbody').on( 'click', 'tr', function () {
//     if ( $(this).hasClass('selected') ) {
//       $(this).removeClass('selected');
//       $(".side-pop").hide();
//     }
//     else {
//       table.$('tr.selected').removeClass('selected');
//       $(this).addClass('selected');
//       var id = $(this).attr('id'); 
//       $(".side-pop").show();
//       $("#show").attr("href","/parent_orders/"+id);
//       $("#destroy").attr("href","/parent_orders/"+id);
//       $("#edit").attr("href","/parent_orders/"+id+"/edit");
//     }
//   }); 
// });

// $(document).ready(function() {
//   var table = $('#enrolment').DataTable({"order": [[ 5, "asc" ]] });
//   $('#enrolment tbody').on( 'click', 'tr', function () {
//     if ( $(this).hasClass('selected') ) {
//       $(this).removeClass('selected');
//       $(".side-pop").hide();
//     }
//     else {
//       table.$('tr.selected').removeClass('selected');
//       $(this).addClass('selected');
//       var id = $(this).attr('id'); 
//       $(".side-pop").show();
//       $("#show").attr("href","/enrolments/"+id);
//     }
//   }); 
// });

$(document).ready(function() {
  var table = $('#tenant_detail').DataTable( { "bSort": false } );
  $('#tenant_detail tbody').on( 'click', 'tr', function () {
    if ( $(this).hasClass('selected') ) {
      $(this).removeClass('selected');
      $(".side-pop").hide();
    }
    else {
      table.$('tr.selected').removeClass('selected');
      $(this).addClass('selected');
      var id = $(this).attr('id'); 
      $(".side-pop").show();
      $("#edit").attr("href","tenant_details/summary_edit/"+id+"/edit");
      $("#show").attr("href","tenant_details/summary_edit/"+id);
    }
  }); 
});

$(document).ready(function() {
  var table = $('#auditreview').DataTable();
  $('#auditreview tbody').on( 'click', 'tr', function () {
    if ( $(this).hasClass('selected') ) {
      $(this).removeClass('selected');
      $(".side-pop").hide();
    }
    else {
      table.$('tr.selected').removeClass('selected');
      $(this).addClass('selected');
      var id = $(this).attr('id'); 
      $(".side-pop").show();
      $("#show").attr("href","/auditreviews/"+id);
      $("#destroy").attr("href","/auditreviews/"+id);
      $("#edit").attr("href","/auditreviews/"+id+"/edit");
    }
  }); 
});

$(document).ready(function() {
  var table = $('#user').DataTable();
  $('#user tbody').on( 'click', 'tr', function () {
    if ( $(this).hasClass('selected') ) {
      $(this).removeClass('selected');
      $(".side-pop").hide();
    }
    else {
      table.$('tr.selected').removeClass('selected');
      $(this).addClass('selected');
      var id = $(this).attr('id'); 
      $(".side-pop").show();
      $("#show").attr("href","/users/"+id);
      $("#destroy").attr("href","/users/"+id);
      $("#edit").attr("href","/users/"+id+"/edit");
    }
  }); 
});

$(document).ready(function() {
  var table = $('#attendance').DataTable({ dom: 'Bfrtip', buttons: [ { extend: 'excelHtml5', text: 'Export' } ] });
});

$(document).ready(function() {
  $('#feedback').DataTable();
});

$(document).ready(function() {
  $('#production_category').DataTable();
});

$(document).ready(function() {
  $('#production_subcategory').DataTable();
});

$(document).ready(function() {
  $('#uom').DataTable();
});

$(document).ready(function() {
  $('#utensils_category').DataTable();
});

// $(document).ready(function() {
//   $('#enrolment').DataTable();
// });

$(document).ready(function() {
  $('#status').DataTable();
});

$(document).ready(function() {
  $('#allery').DataTable();
});

$(document).ready(function() {
  $('#new_enroll').DataTable();
});
$(document).ready(function() {
  $('#delete_enroll').DataTable();
});

$(document).ready(function() {
  $('#recent_order').DataTable();
});
$(document).ready(function() {
  $('#cook_sheet').DataTable();
});
$(document).ready(function() {
  $('#user_feedback').DataTable();
});
$(document).ready(function() {
  $('.table-datatable').DataTable();
});


// $(document).ready(function() {
//   $('#menu_cycle').DataTable().data.reload();
// });

// $(document).ready(function() {
// $('table.cook').DataTable({
//    "bPaginate": false
// });
// });