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

  document.querySelectorAll('.mdc-icon-button').forEach(function(e) {
    new mdc.iconButton.MDCIconButtonToggle.attachTo(e);
  });
  
  document.querySelectorAll('.mdc-menu').forEach(function(e) {
    console.log(e);
    new mdc.menu.MDCMenu.attachTo(e);
  });

  document.querySelectorAll('.mdc-menu-surface').forEach(function(e) {
    new mdc.menuSurface.MDCMenuSurface.attachTo(e);
  });

  document.querySelectorAll('.mdc-list').forEach(function(e) {
    new mdc.list.MDCList.attachTo(e);
    // new mdc.ripple.MDCRipple.attachTo(e);
  });

  document.querySelectorAll('.mdc-chip-set').forEach(function(e) {
    new mdc.chips.MDCChipSet.attachTo(e);
  });

  // // Add a menu effect to all MDC menus
  // const menu = new MDCMenu(document.querySelector('.mdc-menu'));
  // menu.open = true;
  // menu.setFixedPosition(true);
  mdc.autoInit();
  console.log(mdc);
};

function mdcMenuAddClass(object){
  console.log(object);
  document.getElementById(object).className = "mdc-menu mdc-menu-surface mdc-menu-surface--open";
}

// document.onclick = function(){
//   document.getElementById('kc-locale-dropdown').className = "mdc-menu mdc-menu-surface";
// };