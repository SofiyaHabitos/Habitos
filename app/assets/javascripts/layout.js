// nav-toggle
$('#sidebarCollapse').on('click', function (e) {
    $('.page').toggleClass('active');
});

$('#sidebarCollapse').on('click', function() {
  $('#sidebar').toggleClass('active');
});

$(document).ready(function () {
    $(".sidebar_scroll, .menuplanner_sidebar, .modal-scroll tbody").mCustomScrollbar({
        theme: "minimal"
    });
    // $(".menuplanner_main_content, .table_overflow").mCustomScrollbar({
    //   theme: "minimal"
    // });
    
  // $(".table_overflow .table thead tr th")on('click', function(){
  //   debugger;
  //   var th = $(this);
  //   var form = $( this ).find("form.editable-wrap");
  //   var position = th.position();
  //   $(this).find("form.editable-wrap").css({"border": "2px solid red"});
  // });
});

$('#myTab a').on('click', function (e) {
  e.preventDefault()
  $(this).tab('show')
})

$('.control.floating_label').find('.input-text').each(function(){
    if(($.trim($(this).val()).length != 0) && ($(this).is(':valid'))){
      $(this).removeClass('float_input');
      $(this).removeClass('invalid_input');
    }
});
$(".control.floating_label .input-text").keyup(function(){
    if ( ($.trim($(this).val()).length != 0) && ($(this).is(':valid'))){
      $(this).removeClass('float_input');
      $(this).removeClass('invalid_input');
    }
    else{
      if ( ($.trim($(this).val()).length != 0) && ($(this).is(':invalid'))) {
        $(this).addClass('invalid_input');
      }
      else{
        $(this).removeClass('invalid_input');
        if($(this).prop('required')==false){
          $(this).addClass('float_input');
        }
      }
     }
});

$('input.input-text, textarea.input-text').keypress(function(event){
  var keycode = (event.keyCode ? event.keyCode : event.which);
  var val = $(this).val();
  if((keycode == '32') && ($(this).val() == '')){
    return event.which !== 32;
  }
});

$("#clientcategory").selectpicker();
$("#spread_type").selectpicker();

// $('.studenttype').select2();

// $(".spreadtype").select2();

// -----------------------------DONT DELETE THE BELLOW COMMENT LINE'S----------------------------------

// $(document).ready(function() {
//     $('.utensilname').select2();
// });
// $(document).ready(function() { 
//   $(".e1").select2(
//     {
//       allowClear: true
//     }
//   );
// });
// $(document).ready(function() {
//   $(".single").select2();
// });

// -----------------------------DONT DELETE THE ABOVE COMMENT LINE'S----------------------------------

// Accordion
    // $(document).ready(function () {
    //   $('#accordion-transform').click(function (){
    //     $('#accordion-1').toggleClass("col-3");
    //     $('#accordion-2').toggleClass("col-28");
    //     $('#accordion-3').toggleClass("col-70");
    //     $('#accordion-transform').toggleClass("rotate");
    //     $('#accordion-1 .accordion-header').toggleClass("hide");
    //     $('#accordion-1 .tab-content').toggleClass("hide");
    //   });
    // });

//collapse
      // $(document).ready(function () {
      //   $('.collapse_tbl[aria-controls="collapseExample1"]').click(function (){
      //       $('.collapse_tbl[aria-controls="collapseExample1"] i').toggleClass("fa-plus-circle fa-minus-circle");
      //   });        
      //   $('.collapse_tbl[aria-controls="collapseExample2"]').click(function (){
      //       $('.collapse_tbl[aria-controls="collapseExample2"] i').toggleClass("fa-minus-circle fa-plus-circle");
      //   });
      // });

//Scroll

      // $(document).ready(function () {
      //   $('.scroll-pane-1').slimScroll({});
      //   $('.scroll-pane-2').slimScroll({});
      // });


// //Notifications

//       $(document).ready(function () {
//         $('#noti_Button').click(function (){
//             $('#notifications2').hide();

//             // CHECK IF NOTIFICATION COUNTER IS HIDDEN.
//             if ($('#noti_Counter2').is(':hidden')) {
//                 // CHANGE BACKGROUND COLOR OF THE BUTTON.
//                 $('#noti_Button2').css('color', '#2e60ad');
//             }          
//         });
//         $('#noti_Button2').click(function (){
//             $('#notifications').hide();

//             // CHECK IF NOTIFICATION COUNTER IS HIDDEN.
//             if ($('#noti_Counter').is(':hidden')) {
//                 // CHANGE BACKGROUND COLOR OF THE BUTTON.
//                 $('#noti_Button').css('color', '#2e60ad');
//             }          
//         });        
//       });

//     $(document).ready(function () {

//         // ANIMATEDLY DISPLAY THE NOTIFICATION COUNTER.
//         $('#noti_Counter')
//             .css({ opacity: 0 })
//             .text('3')              // ADD DYNAMIC VALUE (YOU CAN EXTRACT DATA FROM DATABASE OR XML).
//             .css({ top: '-10px' })
//             .animate({ top: '-2px', opacity: 1 }, 500);

//         $('#noti_Button').click(function () {

//             // TOGGLE (SHOW OR HIDE) NOTIFICATION WINDOW.
//             $('#notifications').fadeToggle('fast', 'linear', function () {
//                 if ($('#notifications').is(':hidden')) {
//                     $('#noti_Button').css('color', '#2e60ad');
//                 }
//                 else $('#noti_Button').css('color', '#fdc006');        // CHANGE BACKGROUND COLOR OF THE BUTTON.
//             });

//             $('#noti_Counter').fadeOut('slow');                 // HIDE THE COUNTER.

//             return false;
//         });

//         // HIDE NOTIFICATIONS WHEN CLICKED ANYWHERE ON THE PAGE.
//         $(document).click(function () {
//             $('#notifications').hide();

//             // CHECK IF NOTIFICATION COUNTER IS HIDDEN.
//             if ($('#noti_Counter').is(':hidden')) {
//                 // CHANGE BACKGROUND COLOR OF THE BUTTON.
//                 $('#noti_Button').css('color', '#2e60ad');
//             }
//         });

//         $('#notifications').click(function () {
//             return false;       // DO NOTHING WHEN CONTAINER IS CLICKED.
//         });
//     });

// // Notifications2

//     $(document).ready(function () {

//         // ANIMATEDLY DISPLAY THE NOTIFICATION COUNTER.
//         $('#noti_Counter2')
//             .css({ opacity: 0 })
//             .text('99+')              // ADD DYNAMIC VALUE (YOU CAN EXTRACT DATA FROM DATABASE OR XML).
//             .css({ top: '-10px' })
//             .animate({ top: '-2px', opacity: 1 }, 500);

//         $('#noti_Button2').click(function () {

//             // TOGGLE (SHOW OR HIDE) NOTIFICATION WINDOW.
//             $('#notifications2').fadeToggle('fast', 'linear', function () {
//                 if ($('#notifications2').is(':hidden')) {
//                     $('#noti_Button2').css('color', '#2e60ad');
//                 }
//                 else $('#noti_Button2').css('color', '#fdc006');        // CHANGE BACKGROUND COLOR OF THE BUTTON.
//             });

//             $('#noti_Counter2').fadeOut('slow');                 // HIDE THE COUNTER.

//             return false;
//         });

//         // HIDE NOTIFICATIONS WHEN CLICKED ANYWHERE ON THE PAGE.
//         $(document).click(function () {
//             $('#notifications2,#notifications').hide();

//             // CHECK IF NOTIFICATION COUNTER IS HIDDEN.
//             if ($('#noti_Counter2,#noti_Counter').is(':hidden')) {
//                 // CHANGE BACKGROUND COLOR OF THE BUTTON.
//                 $('#noti_Button2,#noti_Button').css('color', '#2e60ad');
//             }
//         });

//         $('#notifications2,#notifications').click(function () {
//             return false;       // DO NOTHING WHEN CONTAINER IS CLICKED.
//         });
//     });