// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).ready(main);


function main(){

    var run = setTimeout(function(){
        setInterval(function(){donGood()}, 3000);
    }, randBetween(300, 1200));

    var run = setTimeout(function(){
        setInterval(function(){donBad()}, 3000);
    }, randBetween(300, 1200));

    var run = setTimeout(function(){
        setInterval(function(){hillGood()}, 3000);
    }, randBetween(300, 1200));

    var run = setTimeout(function(){
        setInterval(function(){hillBad()}, 3000);
    }, randBetween(300, 1200));


}


function donGood() {
    $('#don-good').children("p").remove();

    var height = $('#don-good').height();
    var width = $('#don-good').width();

    var num = randBetween(0, gon.don_good.length);
    var id = randBetween(0,10000);
    // let's move this beyotch

    $("#don-good").append("<p class = 'fading-" + num + "-" + id + "'>" + gon.don_good[num].body + "</p>");
    var thisPar = '.fading-'+num + "-" + id;
    var textHeight = $(thisPar).height();
    var textWidth = $(thisPar).width();
    var deltaHeight = randBetween(0, (height-textHeight));
    var deltaWidth = randBetween(0, (width-textWidth));

    $(thisPar).css("top", deltaHeight);
    $(thisPar).css("left", deltaWidth);

}

function donBad() {
    $('#don-bad').children("p").remove();

    var height = $('#don-bad').height();
    var width = $('#don-bad').width();

    var num = randBetween(0, gon.don_bad.length);
    var id = randBetween(0,10000);
    // let's move this beyotch

    $("#don-bad").append("<p class = 'fading-" + num + "-" + id + "'>" + gon.don_bad[num].body + "</p>");
    var thisPar = '.fading-'+num + "-" + id;
    var textHeight = $(thisPar).height();
    var textWidth = $(thisPar).width();
    var deltaHeight = randBetween(0, (height-textHeight));
    var deltaWidth = randBetween(0, (width-textWidth));

    $(thisPar).css("top", deltaHeight);
    $(thisPar).css("left", deltaWidth);

}


function hillGood() {
    $('#hill-good').children("p").remove();

    var height = $('#hill-good').height();
    var width = $('#hill-good').width();

    var num = randBetween(0, gon.hill_good.length);
    var id = randBetween(0,10000);
    // let's move this beyotch

    $("#hill-good").append("<p class = 'fading-" + num + "-" + id + "'>" + gon.hill_good[num].body + "</p>");
    var thisPar = '.fading-'+num + "-" + id;
    var textHeight = $(thisPar).height();
    var textWidth = $(thisPar).width();
    var deltaHeight = randBetween(0, (height-textHeight));
    var deltaWidth = randBetween(0, (width-textWidth));

    $(thisPar).css("top", deltaHeight);
    $(thisPar).css("left", deltaWidth);

}

function hillBad() {
    $('#hill-bad').children("p").remove();

    var height = $('#hill-bad').height();
    var width = $('#hill-bad').width();

    var num = randBetween(0, gon.hill_bad.length);
    var id = randBetween(0,10000);
    // let's move this beyotch

    $("#hill-bad").append("<p class = 'fading-" + num + "-" + id + "'>" + gon.hill_bad[num].body + "</p>");
    var thisPar = '.fading-'+num + "-" + id;
    var textHeight = $(thisPar).height();
    var textWidth = $(thisPar).width();
    var deltaHeight = randBetween(0, (height-textHeight));
    var deltaWidth = randBetween(0, (width-textWidth));

    $(thisPar).css("top", deltaHeight);
    $(thisPar).css("left", deltaWidth);

}

function randBetween(min, max){
    return Math.floor(Math.random() * (max - min) + min);
}
