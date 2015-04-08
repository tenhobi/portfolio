var elements = ['section', 'main', 'article', 'aside', 'header', 'footer', 'nav', 'figure', 'figcaption'];
for( var i = 0; i < elements.length; i++ ) { document.createElement(elements[i]); }

$(function(){
    $('nav a').on('click', function(e){
        var odkaz    = $(this).attr('href'),
            rychlost = 1000,
            efekt    = "easeInOutQuart";

        $("html, body").stop(true,true).animate(
            { scrollTop: $(odkaz).offset().top },
            rychlost, efekt );

        e.preventDefault();
    });
});