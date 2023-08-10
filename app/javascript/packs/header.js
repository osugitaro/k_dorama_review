$(function(target){
  var element = document.querySelector(target);
  var collapse = bootstrap.Collapse.getInstance(element);
  if( !collapse )
      collapse = new bootstrap.Collapse(element, { toggle: false });
  collapse.hide();
});
