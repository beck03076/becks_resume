// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_directory .
//= require best_in_place
//= require best_in_place.purr
//= require see_more




$(function() {
  /* setting defaults for calendar which pops out on date click */
  $.datepicker.setDefaults({
        inline: true,
        changeMonth: true,
        changeYear: true,
        dateFormat: "yy-mm-dd",
        yearRange: '1980:2050'
    });

  /* Activating Best In Place */
  $(".best_in_place").best_in_place();
  /* show the best in place editable inputs on clicks */
  $('a[class^="link-language"],a[class^="link-framework"],a[class^="link-skill"],a[class^="github_link-user"]').click(function(){
    var cl = $(this).attr('class');
    $('span.best_in_place[data-activator=".' + cl + '"]').removeClass('hide');
  });
   /* hide the best in place output after success */
  $('.best_in_place.hidable').bind("ajax:success", function () {
    $(this).closest('span.best_in_place').addClass('hide');
  });
   /* hide the best in place output blur out without editing */
  $('.best_in_place.hidable').bind("best_in_place:deactivate", function () {
    $(this).closest('span.best_in_place').addClass('hide');
  });
   /* if user hovers out of skills tag hide all the editor activators */
  $('.tag.medium').hover(function(){},function(){
    $('div[class^="activators-"]').addClass('hide');
  })
   /* if user hovers on the skills show the edit links for name | link */
  $('a.bip-link-skill').hover(function(){
    $('div[class^="activators-"]').addClass('hide');
    var id = $(this).data('id');
    $('.activators-' + id).removeClass('hide');
  });
  /* taking the tour */
  $("#tour").click(function (){
    // show the stopper which stops the tour
    $('#stopper').css('display','');
    // delay of every popovers
    var speed = 9000;
    // array of classes to take tour
    i = ["p-s","r-o-r","organizor","crawlfish","see-more","s-o"]
    // eaching every element and seeing the sight
    $.each(i, function(index,v){  
      var timer = setTimeout(function () {
        sightSeeing('span.tour.' + v + '-h','span.' + v,index,i.length,speed);
      }, index * speed);
      // on click for stopper clears the timer, hides the stopper and scrolls to top
      $('#stopper').click(function(){
         clearTimeout(timer);
         $(this).css('display','none');
         scroll(0,0);
      });
    });
  });  
  
  /* on outside click remove popovers */
  $(document).mouseup(function (e) {
    if ($('.popover').has(e.target).length === 0) {
        $('.popover').toggleClass('in').remove();
        return;
    }
  });

});

/* function to fetch html for the given class, popover and scrollinto view */
function sightSeeing(html_cl,target_cl,index,iLen,speed){
     // remove all popovers
     $('.popover').remove();
     //start popping over on the target class
     $(target_cl).popover({
        html: true,
        placement: "right",
        // fetch title from DOM
        title: function () {
            return $(html_cl).find('.title').html();
        },
        // fetch content from DOM
        content: function () {
            return $(html_cl).find('.content').html();
        }
     });     
     // actual show of the popover
     $(target_cl).popover('show');
     // scrolling to the element on which we are popping over
     scrollToCurrent(target_cl);
     // identifying the last element in each to remove all popovers, hide stopper and scroll to top
     if ((index + 1) == iLen){
       setTimeout(function () {  
         $('.popover').remove();
         $('#stopper').css('display','none');
         scroll(0,0);
       },speed);
     }
     
}
/* function to scroll the window to this position of the element passed */
function scrollToCurrent(obj){
    var offset = $(obj).offset(); 
     offset.left -= 20;
     offset.top -= 200;
     scroll(offset.top,offset.left);    
}
/* given co ordinates as numbers to top and left it will scroll */
function scroll(top,left){
   $('html, body').animate({
        scrollTop: top,
        scrollLeft: left
   });  
}






