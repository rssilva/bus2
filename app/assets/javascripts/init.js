window.BUS2 = {};

window.BUS2.Eventer = $({});
window.BUS2.mainContainer = $('.bus2-main');
window.BUS2.isLogged = false;
window.BUS2.TOKEN = null;

if (window.localStorage) {
  window.BUS2.TOKEN = window.localStorage.getItem('TOKEN');
}
