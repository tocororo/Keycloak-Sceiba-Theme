window.onload = function() {


  // Initialise all MDC text fields
  document.querySelectorAll('.mdc-text-field').forEach(function(e) {
    new mdc.textField.MDCTextField(e);
  });

  // Initialise all MDC text field icons
  document.querySelectorAll('.mdc-text-field__icon').forEach(function(e) {
    new mdc.textField.MDCTextFieldIcon(e);
  });

  // Add a ripple effect to all MDC buttons
  document.querySelectorAll('.mdc-button').forEach(function(e) {
    new mdc.ripple.MDCRipple.attachTo(e);
  });

  // Initialise all MDC icons
  document.querySelectorAll('.mdc-icon-button').forEach(function(e) {
    new mdc.iconButton.MDCIconButtonToggle.attachTo(e);
  });
  
  // Initialise all MDC menu
  document.querySelectorAll('.mdc-menu').forEach(function(e) {
    new mdc.menu.MDCMenu.attachTo(e);
    mdc.menu.open = true;
  });

  // Initialise all MDC menu surface
  document.querySelectorAll('.mdc-menu-surface').forEach(function(e) {
    new mdc.menuSurface.MDCMenuSurface.attachTo(e);
  });

  // Initialise all MDC list
  document.querySelectorAll('.mdc-list').forEach(function(e) {
    new mdc.list.MDCList.attachTo(e);
    // new mdc.ripple.MDCRipple.attachTo(e);
  });

  // Initialise all MDC chip
  document.querySelectorAll('.mdc-chip-set').forEach(function(e) {
    new mdc.chips.MDCChipSet.attachTo(e);
  });

  // Initialise all MDC drawer
  document.querySelectorAll('.mdc-drawer').forEach(function(e) {
    new mdc.drawer.MDCDrawer.attachTo(e);
  });

  // Initialise all MDC tooltip
  document.querySelectorAll('.mdc-tooltip').forEach(function(e) {
    new mdc.tooltip.MDCTooltip.attachTo(e);
  });
  mdc.autoInit();

  // select the drawer menu to make as selected the item that its url is equal to the current one
  const drawer = document.getElementsByClassName('mdc-drawer__content');
  // get all children on second level. First level is a tag `nav` and the second level is all tags `a`
  var a = drawer[0].children[0].childNodes;
  a.forEach(element => {
    if (element.href == window.location.href){
      element.className = "mdc-list-item mdc-list-item--activated";
    }
  });
};

// TODO: "temporal function", menu open don't work good, so this function is to add or remove class 'mdc-menu-surface--open' on button clik.
function mdcMenuAddClass(object){
  // remove all '.mdc-menu-surface--open' class to close all menus
  document.querySelectorAll('.mdc-menu-surface--open').forEach(function(e) {
    e.className = "mdc-menu mdc-menu-surface";
  });
  // add class '.mdc-menu-surface--open' to especific menu
  document.getElementById(object).className = "mdc-menu mdc-menu-surface mdc-menu-surface--open";
}