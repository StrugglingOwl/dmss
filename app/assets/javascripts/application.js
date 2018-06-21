// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require bootstrap
//= require turbolinks
//= require bootstrap/alert
//= require bootstrap/dropdown
//= require bootstrap/modal
//= require_tree .

// 实现flash提示信息自动消失
$(document).on('turbolinks:load', function() {
  // 菜单自动打开
  $('.dropdown').hover(function() {
    $(this).addClass('open');
  },
  function() {
    $(this).removeClass('open');
  });
  // 收起通知
  slideUpAlert();
});
// 收起通知信息
function slideUpAlert() {
  // 消息停留1500毫秒（1.5秒），消失动画时间250毫秒
  $(".alert").delay(1500).slideUp(250, function() {
    $(this).remove();
  });
}

//= require bootstrap/collapse
