// jquery ready
$(document).on('page:change turbolinks:load',function(){
  AutomaticLogout.load();
})