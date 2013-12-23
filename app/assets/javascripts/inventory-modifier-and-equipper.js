$(document).ready(function() {

    var hoverHTMLDemoBasic = '<p>sup</p>'

    $(".users_current_inventory")
    .hovercard({
      detailsHTML: hoverHTMLDemoBasic,
        openOnBottom: true,
        width: 500,
        cardImgSrc: 'http://ejohn.org/files/short.sm.jpg'
    });
//    .hoverintent({
//        sensitivity: 7,
//      interval:500,timeout:0,
//      over: openFancybox,
//      out: closeFancybox 
//    });

  //Hover effect for items in the inventory
  //Equip Items
  //Unequip items
  //Delete items


});





//      $(this.id).hovercard({
//          detailsHTML: hoverHTMLDemoBasic,
//          openOnTop: true,
//          width: 500,
//          cardImgSrc: 'http://ejohn.org/files/short.sm.jpg',
//          onHoverOut: function() {
//
//          }
//      });
