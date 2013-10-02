var base_url = "https://s3-us-west-2.amazonaws.consoleom/nicole-brent-wedding/"

function onAlbumUpload() {
	filepicker.pickAndStore(

		{mimetype:"image/*"},
        
    {location:"S3", access: "public", multiple: "true"}, 

    function(InkBlobs){
			console.log(JSON.stringify(InkBlobs))
 		}, 

 		function(FPError){
 			console.log(JSON.stringify(FPError));
 		});
}

function onImageUpload() {
  filepicker.pick(
    {mimetype: "image/*"},

    function(InkBlobs){
      console.log(JSON.stringify(InkBlobs))
    },

    function(FPError){
      console.log(JSON.stringify(FPError));
    });
}

$(document).ready(function() {

  $('.loc-link').on('click', function(e) {
    e.preventDefault();
    $(this).parent().find('.popup').toggle('drop');
    $(this).find('.caret').toggleClass('upside-down');
  });

  $(window).scroll(function(event) {

    var $mainNav = $('#main-nav');
    var $story = $('.story');
    var $intro = $('.intro');
    var $body = $('body');
    var slideHeight = $('.intro-slide').height();
    var scrollTop = $(window).scrollTop();
    var blankScreenHeight = $('.blank-screen').outerHeight();
    var totalScreenHeight = blankScreenHeight - 60;
    var navBarShouldScroll = scrollTop > totalScreenHeight;
    var storyShouldBeFixed = scrollTop > blankScreenHeight - 13;
    var $scrollTip = $('.scroll-tip');

    if (navBarShouldScroll && $story.length > 0) {
      $mainNav.removeClass('navbar-fixed-top');
      $mainNav.addClass('navbar-scroll');
    } else {
      $mainNav.removeClass('navbar-scroll');
      $mainNav.addClass('navbar-fixed-top');
    };

    if (storyShouldBeFixed && $story.length > 0) {
      $story.addClass('story-fixed');
      $intro.addClass('intro-fixed');
      $intro.removeClass('white');
      $body.removeClass('background-home');
      $scrollTip.css({display: "none"});
    } else {
      $story.removeClass('story-fixed');
      $intro.removeClass('intro-fixed');
      $intro.addClass('white');
      $body.addClass('background-home');
      $scrollTip.css({display: "block"});
    };
  });
  
  var $alert = $('.alert');
  var $whiteScreen = $('.white-screen');
  var $intro = $('.intro');
  var alertHeight = - $alert.outerHeight() - 10;

  if ($alert.length > 0) {
    $whiteScreen.css({top: alertHeight});
    $intro.css({top: alertHeight});
  };

  $('.close').on('click', function() {
    $whiteScreen.css({top: 4});
    $intro.css({top: 4});
  });

  

  $('.intro-slide').each(function() {
    var slideHeight = $('.intro-slide').height();
    var contentHeight = $(this).find('p').height();
    var storyOffset = $('.story').height()/2;
    var slideMargin = (1 - contentHeight/slideHeight)/2 * slideHeight + storyOffset;
    $(this).find('p').css({top: slideMargin});
  });



  var controller = $.superscrollorama({});

  var screenHeight = $('body').height();

  var slideOffset = -screenHeight/4
  var slideDuration = screenHeight

  controller.addTween('.intro',
    TweenMax.from($('.intro'), .5, {css:{opacity:0.7}}), slideDuration * 0.8, slideOffset);

  controller.pin($('.intro-slide').filter('#boy'), slideDuration, {
    anim: (new TimelineLite())
      .append(
        TweenMax.from($('#boy'), .5, {css:{opacity:0}})
      ), pushFollowers: false
  });

  controller.pin($('.intro-slide').filter('#girl'), slideDuration, {
    anim: (new TimelineLite())
      .append(
        TweenMax.from($('#girl'), .5, {css:{opacity:0}})
      ), pushFollowers: false
  });

  controller.pin($('.intro-slide').filter('#path-cross'), slideDuration, {
    anim: (new TimelineLite())
      .append([
        TweenMax.from($('#paths'), .5, 
          {css:{opacity:0,left:1000}}), 
        TweenMax.from($('#december'), .5, 
          {css:{opacity:0,right:1000}}), 
        TweenMax.from($('#crossed'), .5, {css:{opacity:0}})
      ]), pushFollowers: false
  });

  controller.pin($('.intro-slide').filter('#moved'), slideDuration, {
    anim: (new TimelineLite())
      .append([
        TweenMax.from($('#moved'), .5, {css:{opacity:0}}),
        TweenMax.from($('#moving'), .5, {css:{right:1000}})
      ]), pushFollowers: false
  });

  controller.pin($('.intro-slide').filter('#falling'), slideDuration, {
    anim: (new TimelineLite())
      .append([
        TweenMax.from($('#falling'), .5, {css:{opacity:0}}),
        TweenMax.from($('#they'), .5, {css:{opacity:0,top:-1000}}),
        TweenMax.from($('#began'), .5, {css:{opacity:0,top:-1500}}),
        TweenMax.from($('#to'), .5, {css:{opacity:0,top:-2000}}),
        TweenMax.from($('#fall'), .5, {css:{opacity:0,top:-2500}}),
        TweenMax.from($('#more'), .5, {css:{opacity:0,top:-3000}}),
        TweenMax.from($('#in'), .5, {css:{opacity:0,top:-3500}}),
        TweenMax.from($('#love'), .5, {css:{opacity:0,top:-4000}})
      ]), pushFollowers: false
  });


  if ($(window).width() > 960) {
    controller.pin($('.intro-slide').filter('#family'), slideDuration, {
    anim: (new TimelineLite())
      .append(
        TweenMax.from($('#family'), .5, {css:{opacity:0}})
      )
      .append([
        TweenMax.fromTo($('#family img'), .5, 
          {css:{opacity:0,width:15+"%",left:42.5+"%"}}, {css:{opacity:1, width:40+"%",left:30+"%"}}),
        TweenMax.fromTo($('#family p'), .5, 
          {css:{opacity:1}}, {css:{opacity:0}})
      ]), pushFollowers: false
    });
  } else if ($(window).width() < 767) {
    controller.pin($('.intro-slide').filter('#family'), slideDuration, {
      anim: (new TimelineLite())
        .append(
          TweenMax.from($('#family'), .5, {css:{opacity:0}})
        )
        .append([
          TweenMax.fromTo($('#family img'), .5, 
            {css:{opacity:0,width:15+"%",left:42.5+"%"}}, {css:{opacity:1, width:75+"%",left:12.5+"%"}}),
          TweenMax.fromTo($('#family p'), .5, 
            {css:{opacity:1}}, {css:{opacity:0}})
        ]), pushFollowers: false
    });
  } else {
    controller.pin($('.intro-slide').filter('#family'), slideDuration, {
      anim: (new TimelineLite())
        .append(
          TweenMax.from($('#family'), .5, {css:{opacity:0}})
        )
        .append([
          TweenMax.fromTo($('#family img'), .5, 
            {css:{opacity:0,width:15+"%",left:42.5+"%"}}, {css:{opacity:1, width:60+"%",left:20+"%"}}),
          TweenMax.fromTo($('#family p'), .5, 
            {css:{opacity:1}}, {css:{opacity:0}})
        ]), pushFollowers: false
    });
  }

  controller.pin($('.intro-slide').filter('#ring'), slideDuration, {
    anim: (new TimelineLite())
      .append(
        TweenMax.from($('#ring p'), .5, {css:{opacity:0}})
      )
      .append(
        TweenMax.from($('#ring img'), .5, {css:{opacity:0}})
      )
  });

  controller.pin($('.intro-slide').filter('#careers'), slideDuration, {
    anim: (new TimelineLite())
      .append(
        TweenMax.fromTo($('#careers'), .5, 
          {css:{opacity:1}}, {css:{opacity:0}})
      )
  });

  controller.addTween('#wedding',
    TweenMax.from($('#wedding'), 1.5, {css:{opacity:0}}));



});