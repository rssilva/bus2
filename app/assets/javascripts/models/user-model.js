(function () {
  BUS2.UserModel = {
    init: function () {

    },

    isLogged: function () {
      var token = window.localStorage.getItem('TOKEN');
      console.log(token)
    }
  }
})();
