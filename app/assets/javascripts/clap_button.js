const $clap = $('.clap:visible');
const clap = $clap[0];
const clapIcon = $clap.find('#clap--icon')[0];
const clapCount = $clap.find('#clap--count')[0];
const clapTotalCount = $clap.find('#clap--count-total')[0];
const initialNumberOfClaps = $clap.data('init-count');
const tlDuration = 300;
let numberOfClaps = 0;
let clapHold;

const triangleBurst = new mojs.Burst({
  parent: clap,
  radius: {50: 95},
  count: 5,
  angle: 30,
  children: {
    shape: 'polygon',
    radius: {6: 0},
    scale: 1,
    stroke: 'rgba(211,84,0 ,0.5)',
    strokeWidth: 2,
    angle: 210,
    delay: 30,
    speed: 0.2,
    easing: mojs.easing.bezier(0.1, 1, 0.3, 1),
    duration: tlDuration
  }
});
const circleBurst = new mojs.Burst({
  parent: clap,
  radius: {50: 75},
  angle: 25,
  duration: tlDuration,
  children: {
    shape: 'circle',
    fill: 'rgba(149,165,166 ,0.5)',
    delay: 30,
    speed: 0.2,
    radius: {3: 0},
    easing: mojs.easing.bezier(0.1, 1, 0.3, 1),
  }
});
const countAnimation = new mojs.Html({
  el: clapCount,
  isShowStart: false,
  isShowEnd: true,
  y: {0: -30},
  opacity: {0: 1},
  duration: tlDuration
}).then({
  opacity: {1: 0},
  y: -80,
  delay: tlDuration / 2
});
const countTotalAnimation = new mojs.Html({
  el: clapTotalCount,
  isShowStart: false,
  isShowEnd: true,
  opacity: {0: 1},
  delay: 3 * (tlDuration) / 2,
  duration: tlDuration,
  x: {'-10': 0}
});

$clap.find('#clap--count-total').css({'opacity': 1, 'transform': 'none'});

const scaleButton = new mojs.Html({
  el: clap,
  duration: tlDuration,
  scale: {1.3: 1},
  easing: mojs.easing.out
});
clap.style.transform = "scale(1, 1)"; /*Bug1 fix*/

const animationTimeline = new mojs.Timeline();
animationTimeline.add([
  triangleBurst,
  circleBurst,
  countAnimation,
  countTotalAnimation,
  scaleButton
]);


$clap.click(function () {
  if (numberOfClaps === 0) {
    $clap.find('#clap--count-total').css({'opacity': 0, 'transform': 'scale(0)','margin-top': '0'});
  }
  if (getCookie('is_clapped') === '') {
    $.ajax({
      method: 'PATCH',
      url: document.location.href + '/clap',
      dataType: 'json',
      success: function () {
        repeatClapping();
        document.cookie = 'is_clapped=true;'
      },
      error: function () {
        alert('Xảy ra lỗi không thể vỗ tay :(');
      }
    });
  } else {
    alert('Rất tiếc, mỗi người chỉ được vỗ tay 1 lần!');
  }
});

clap.addEventListener('mousedown', function () {
  clapHold = setInterval(function () {
    repeatClapping();
  }, 400)
});

clap.addEventListener('mouseup', function () {
  clearInterval(clapHold);
});


function repeatClapping() {
  updateNumberOfClaps();
  animationTimeline.replay();
  clapIcon.classList.add('checked')
}

function updateNumberOfClaps() {
  numberOfClaps++;
  clapCount.innerHTML = "+" + numberOfClaps;
  clapTotalCount.innerHTML = initialNumberOfClaps + numberOfClaps
}

$floatSidebarPc = $('.float-sidebar-pc:visible');
if ($floatSidebarPc.length) {
  const offsetTop = $floatSidebarPc[0].offsetTop;
  const imgHeaderHeight = $('header.masthead').height();
  $(document).scroll(function() {
    let scroll_distance = $(window).scrollTop();
    if (scroll_distance >= imgHeaderHeight - 10) {
      $floatSidebarPc.css({'position': 'fixed', 'top': '75px'});
    } else {
      $floatSidebarPc.css({'position': 'absolute', 'top': offsetTop + 'px'});
    }
  });
}

/*====== TODO ==========
    1. Bug fix. The button shouldn't
scale up before being clicked (fixed)
2. Shadow should NOT fire hover
animation in succession.
Some sort of delay is delay. (Not that important)
3. Hover animation should be
absent upon click (Not that important)
4. Handle onpress event on the button (Implemetaation is Buggy ATM)
5. Dynamically change burst angle
everytime button is clicked
=========================*/