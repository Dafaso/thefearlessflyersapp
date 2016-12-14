

var open=false;

$("html").click(function(){
    if (open===true){
   $("#drop-menu").slideUp(20,function(){
       open=false;
   });
        
    };    
});

$(".menu-about").click(function(e) {
    e.preventDefault();
    $("#drop-menu").slideToggle(50,"linear",
    function(){
        if (open===false){
            open=true;
        }else{
            open=false;
        };
    });
});    


//$(".r").click(function(e){
//    e.preventDefault();
//    $(".hideul").css("display","block");
//});

$("#nav_lines").on("click", function(){
    $("#mobile_menu").slideToggle(600);
    $(".hamburger").toggleClass("hamburger_toggle");
    $("#mobile-drop").slideUp(300);
}); //mobile menu

$(".mobile-menu-about").click(function(e){
    e.preventDefault();
$("#mobile-drop").slideToggle(300);
}); //"About" mobile sub-menu

$(".donate-button").click(function(){
    $("#mobile_menu").slideUp(300);
});

$(window).resize(function(){
    if($(this).width() > 1020){
   $("#mobile_menu").slideUp(100); 
   $(".hamburger").removeClass("hamburger_toggle");   $("#mobile-drop").slideUp(100);     
    }//close full screen drop menu when pc screen increases.
});



$('.gallery').justifiedGallery({
    rowHeight : 150,
    lastRow : 'nojustify',
    margins : 5,
    border : 5, 
    
    
    sizeRangeSuffixes : {
        'lt100':'_a', 
        'lt240':'_b', 
        'lt320':'_c', 
        'lt500':'_d', 
        'lt640':'_e', 
        'lt1024':'_f'
    },
    
    captionSettings : {
        animationDuration: 1100,
        visibleOpacity: 0.9,
        nonVisibleOpacity: 0.0
    },
    
    rel : 'gallery1',
    
    
}).on('jg.complete', function () {
    $(this).find('a').baguetteBox({
       
    });
});
